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
    var activityIndicator: UIActivityIndicatorView!

    func dateMask(from string: String) -> String? {
        if let dateFromString = stringToDate(from: string) { //Date as "dd/MM/yyyy"
            let stringFromDate = dateToString(from: dateFromString) //Date as "yyyy-MM-dd"
            return stringFromDate
        } else {
            return nil
        }
    }

    func stringToDate(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        if let date = dateFormatter.date(from: string) {
            return date
        } else {
            return nil
        }
    }

    func dateToString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let string = dateFormatter.string(from: date)
        return string
    }

    func replaceCommaForDot(at string: String) -> String {
        let newString = string.replacingOccurrences(of: ",", with: ".")
        return newString
    }

    func showLoading(on button: UIButton) {
        if activityIndicator == nil {
            DispatchQueue.main.async(execute: {
                self.activityIndicator = self.createActivityIndicator()
                self.startLoading(at: button)
            })
        } else {
            self.startLoading(at: button)
        }
    }

    private func startLoading(at button: UIButton) {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(activityIndicator)
        button.setTitle("", for: .normal)
        centerActivityIndicator(in: button)
        activityIndicator.startAnimating()
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        return UIActivityIndicatorView()
    }

    private func centerActivityIndicator(in button: UIButton) {
        let xCenterConstraint = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        button.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        button.addConstraint(yCenterConstraint)
    }

    func hideLoading(on button: UIButton) {
        DispatchQueue.main.async(execute: {
            button.setTitle("Simular", for: .normal)
            self.activityIndicator.stopAnimating()
        })
    }
}
