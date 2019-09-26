//
//  Contants.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/25/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation

struct Alert {
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

struct ViewController {
    static let resultViewController = "InvestmentResultViewController"
}
