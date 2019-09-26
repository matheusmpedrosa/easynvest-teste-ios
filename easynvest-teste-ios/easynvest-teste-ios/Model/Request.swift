//
//  Request.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/22/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation

enum RequestParams: String {
    case investedAmount
    case index
    case rate
    case isTaxFree
    case maturityDate
}

class Request {
    var investedAmount: String = ""
    var index: String = "CDI"
    var rate: String = ""
    var isTaxFree: Bool = false
    var maturityDate: String = ""

    var params: [String: Any] {
        return [
            RequestParams.investedAmount.rawValue: investedAmount,
            RequestParams.index.rawValue: index,
            RequestParams.rate.rawValue: rate,
            RequestParams.isTaxFree.rawValue: isTaxFree,
            RequestParams.maturityDate.rawValue: maturityDate
        ]
    }

    init(investedAmount: String, rate: String, maturityDate: String) {
        self.investedAmount = investedAmount
        self.rate = rate
        self.maturityDate = maturityDate
    }
}
