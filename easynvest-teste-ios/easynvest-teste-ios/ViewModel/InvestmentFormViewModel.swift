//
//  InvestmentFormViewModel.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/22/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation
import UIKit

class InvestmentFormViewModel {
    func dateMask(from string: String) -> String {
        let dateFromString = stringToDate(from: string) //Date as "dd/MM/yyyy"
        let stringFromDate = dateToString(from: dateFromString) //Date as "yyyy-MM-dd"
        return stringFromDate
    }
    
    func stringToDate(from string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        if let date = dateFormatter.date(from:string) {
            return date
        }
        return Date()
    }
    
    func dateToString(from date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let string = dateFormatter.string(from: date)
        return string
    }
}
