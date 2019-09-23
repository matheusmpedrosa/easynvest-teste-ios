//
//  APIInvestmentRepository.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/22/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation

protocol InvestmentRepository {
    func getInvestiment(params: InvestmentFormViewModel, completion: @escaping (Investment?) -> Void)
}

class APIInvestmentRepository {
    class func getInvestiment(params: [String: Any], completion: @escaping (Investment?) -> Void) {
        let session = URLSession.shared
        let request = createRequest(with: params)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                completion(self.createInvestment(from: data))
            } else {
                print("Error: \(String(describing: error))")
                completion(nil)
            }
        }
        
        dataTask.resume()
    }
    
    class private func createRequest(with params: [String: Any]) -> URLRequest{
        let urlString = "https://api-simulator-calc.easynvest.com.br/calculator/simulate"
        let urlComponents = URLComponents(string: urlString)
        var items = [URLQueryItem]()
        
        for (key, value) in params {
            items.append(URLQueryItem(name: key, value: String(describing: value)))
        }
        
        if var urlComponents = urlComponents {
            urlComponents.queryItems = items
            if let url = urlComponents.url {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "GET"
                return urlRequest
            }
        }
        
        return URLRequest(url: URL(string: "")!) //should never return
    }
    
    class private func createInvestment(from data: Data) -> Investment? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let investmentDTO = try? decoder.decode(InvestmentDTO.self, from: data) else {
            return nil
        }
        
        return InvestmentDTOMapper.map(investmentDTO)
    }
}
