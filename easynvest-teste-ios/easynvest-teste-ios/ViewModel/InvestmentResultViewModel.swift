//
//  InvestmentResultViewModel.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/23/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation
import UIKit

class InvestmentResultViewModel {
    func toBrazilianReal(double: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        if let real = formatter.string(from: NSNumber(value: double)) {
            return real
        }
        return ""
    }

    func withRateCharacter(double: Double) -> String {
        return "\(double)%"
    }

    func taxesAmountAndRate(with amount: Double, rate: Double) -> String {
        return "(\(self.withRateCharacter(double: amount)))\(self.withRateCharacter(double: rate))"
    }

//    yyyy-MM-dd'T'HH:mm:ssZ
    func convertDate(from string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        dateFormatter.locale = Locale(identifier: "pt_BR")
        if let date = dateFormatter.date(from: string) {
            return self.dateToString(from: date)
        }
        return ""
    }

    func dateToString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let string = dateFormatter.string(from: date)
        return string
    }

    func manageTableViewCells(cell: UITableViewCell, indexPath: IndexPath, result: Investment) {
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Valor aplicado inicialmente"
            cell.detailTextLabel?.text = toBrazilianReal(double: result.investmentParameter.investedAmount)
        case 1:
            cell.textLabel?.text = "Valor bruto do investimento"
            cell.detailTextLabel?.text = toBrazilianReal(double: result.grossAmount)
        case 2:
            cell.textLabel?.text = "Valor do rendimento"
            cell.detailTextLabel?.text = toBrazilianReal(double: result.grossAmountProfit)
        case 3:
            cell.textLabel?.text = "IR sobre o investimento"
            cell.detailTextLabel?.text = taxesAmountAndRate(with: result.taxesAmount, rate: result.taxesRate)
        case 4:
            cell.textLabel?.text = "Valor líquido do investimento"
            cell.detailTextLabel?.text = toBrazilianReal(double: result.netAmount)
        case 5:
            cell.isAccessibilityElement = false
            cell.contentView.isAccessibilityElement = false
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""
        case 6:
            cell.textLabel?.text = "Data de resgate"
            cell.detailTextLabel?.text = convertDate(from: result.investmentParameter.maturityDate)
        case 7:
            cell.textLabel?.text = "Dias corridos"
            cell.detailTextLabel?.text = result.investmentParameter.maturityTotalDays.description
        case 8:
            cell.textLabel?.text = "Rendimento mensal"
            cell.detailTextLabel?.text = withRateCharacter(double: result.monthlyGrossRateProfit)
        case 9:
            cell.textLabel?.text = "Percentual do CDI do investimento"
            cell.detailTextLabel?.text = withRateCharacter(double: result.investmentParameter.rate)
        case 10:
            cell.textLabel?.text = "Rentabilidade anual"
            cell.detailTextLabel?.text = withRateCharacter(double: result.annualNetRateProfit)
        case 11:
            cell.textLabel?.text = "Rentabilidade no período"
            cell.detailTextLabel?.text = withRateCharacter(double: result.annualGrossRateProfit)
        default:
            break
        }
    }
}
