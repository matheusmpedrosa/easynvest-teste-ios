//
//  InvestmentDTO.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/22/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation

struct InvestmentDTO: Decodable {
    let investmentParameter: InvestmentParameterDTO
    let grossAmount: Double
    let taxesAmount: Double
    let netAmount: Double
    let grossAmountProfit: Double
    let netAmountProfit: Double
    let annualGrossRateProfit: Double
    let monthlyGrossRateProfit: Double
    let dailyGrossRateProfit: Double
    let taxesRate: Double
    let rateProfit: Double
    let annualNetRateProfit: Double
}
