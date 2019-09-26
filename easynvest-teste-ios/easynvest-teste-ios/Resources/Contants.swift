//
//  Contants.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/25/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation

struct API {
    static url = "https://api-simulator-calc.easynvest.com.br/calculator/simulate"
}

struct Alerts {
    static let kWaitTitle = "Calma, jovem!"
    static let kWaitDescription = "Antes de simular o investimento, preencha corretamente todo o formulário."
    static let kWaitOption = "Tô calmo"
    static let kResquestTitle = "Ops..."
    static let kResquestDescription = "Algo deu errado na simulação. Tente novamente."
    static let kResquestOption = "Tudo bem"
    static let kDateTitle = "Ops..."
    static let kDateDescription = "Parece que a data inserida está incorreta. De preferência, escreva no formato \"dd/MM/yyyy\"."
    static let kDateOption = "Vou arrumar"
}

struct ViewControllers {
    static let kResultViewController = "InvestmentResultViewController"
}

struct Labels {
    // MARK: - InvestmentFormView
    static let kInvestedAmountLabel = "Quanto você gostaria de aplicar? *"
    static let kInvestedAmountTextField = "Campo de texto para o quanto você gostaria de aplicar."
    static let kMaturityDateLabel = "Qual a data de vencimento do investimento? *"
    static let kMaturityDateTextField = "Campo de texto para a data de vencimento do investimento."
    static let kInvestmentCDIRateLabel = "Qual o percentual do CDI do investimento? *"
    static let kInvestmentCDIRateTextField = "Campo de texto para o percentual do CDI do investimento."
    static let kSimulateButton = "Simular"
    // MARK: - InvestmentResultView
    static let kInvestmentResultLabel = "Resultado da simulação"
    static let kProfitabilityLabel = "Rendimento total de "
    // MARK: - SimulateAgainView
    static let kSimulateAgainButton = "Simular novamente"
    // MARK: - RightDetailTableViewCell
    static let kInvestedAmount = "Valor aplicado inicialmente"
    static let kGrossAmount = "Valor bruto do investimento"
    static let kGrossAmountProfit = "Valor do rendimento"
    static let kTaxesAmount = "IR sobre o investimento"
    static let kNetAmount = "Valor líquido do investimento"
    static let kMaturityDate = "Data de resgate"
    static let kMaturityTotalDays = "Dias corridos"
    static let kMonthlyGrossRateProfit = "Rendimento mensal"
    static let kRate = "Percentual do CDI do investimento"
    static let kAnnualNetRateProfit = "Rentabilidade anual"
    static let kAnnualGrossRateProfit = "Rentabilidade no período"
}

struct CellIdentifiers {
    static let kRightDetail = "rightDetailCell"
}

struct Views {
    static let kSimulateAgainView = "SimulateAgainView"
}
