//
//  InvestmentParameterDTO.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/22/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation

struct InvestmentParameterDTO: Decodable {
    let investedAmount: Double
    let yearlyInterestRate: Double
    let maturityTotalDays: Int
    let maturityBusinessDays: Int
    let maturityDate: String
    let rate: Double
    let isTaxFree: Bool
}
