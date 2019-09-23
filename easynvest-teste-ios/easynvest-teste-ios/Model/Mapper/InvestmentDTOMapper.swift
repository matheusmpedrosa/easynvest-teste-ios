//
//  InvestmentDTOMapper.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/22/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation

struct InvestmentDTOMapper {
    static func map(_ dto: InvestmentDTO) -> Investment {
        return Investment(investmentParameter: InvestmentParameter(investedAmount: dto.investmentParameter.investedAmount,
                                                                   yearlyInterestRate: dto.investmentParameter.yearlyInterestRate,
                                                                   maturityTotalDays: dto.investmentParameter.maturityTotalDays,
                                                                   maturityBusinessDays: dto.investmentParameter.maturityBusinessDays,
                                                                   maturityDate: dto.investmentParameter.maturityDate,
                                                                   rate: dto.investmentParameter.rate,
                                                                   isTaxFree: dto.investmentParameter.isTaxFree),
                          grossAmount: dto.grossAmount,
                          taxesAmount: dto.taxesAmount,
                          netAmount: dto.netAmount,
                          grossAmountProfit: dto.grossAmountProfit,
                          netAmountProfit: dto.netAmountProfit,
                          annualGrossRateProfit: dto.annualGrossRateProfit,
                          monthlyGrossRateProfit: dto.monthlyGrossRateProfit,
                          dailyGrossRateProfit: dto.dailyGrossRateProfit,
                          taxesRate: dto.taxesRate,
                          rateProfit: dto.rateProfit,
                          annualNetRateProfit: dto.annualNetRateProfit)
    }
}
