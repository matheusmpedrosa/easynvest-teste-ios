//
//  InvestmentFormView.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/21/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import UIKit

protocol InvestmentFormViewProtocol: class {
    func presentResultViewController(result: Investment)
    func showAlertForEmptyTextFields()
    func showAlertForRequestErorr()
    func showAlertForWrongDateFormat()
}

class InvestmentFormView: UIView {
    @IBOutlet weak var investedAmountLabel: UILabel! {
        didSet {
            investedAmountLabel.isAccessibilityElement = true
            investedAmountLabel.accessibilityLabel = "Quanto você gostaria de aplicar? *"
            investedAmountLabel.accessibilityTraits = .staticText
        }
    }
    @IBOutlet weak var investedAmountTextField: UITextField! {
        didSet {
            investedAmountTextField.text = "1024"
            investedAmountTextField.delegate = self
            investedAmountTextField.isAccessibilityElement = true
            investedAmountTextField.accessibilityLabel = "Campo de texto para o quanto você gostaria de aplicar."
            investedAmountTextField.accessibilityTraits = .searchField
        }
    }
    @IBOutlet weak var maturityDateLabel: UILabel! {
        didSet {
            maturityDateLabel.isAccessibilityElement = true
            maturityDateLabel.accessibilityLabel = "Qual a data de vencimento do investimento? *"
            maturityDateLabel.accessibilityTraits = .staticText
        }
    }
    @IBOutlet weak var maturityDateTextField: UITextField! {
        didSet {
            maturityDateTextField.text = "14/06/2024"
            maturityDateTextField.delegate = self
            maturityDateTextField.isAccessibilityElement = true
            maturityDateTextField.accessibilityLabel = "Campo de texto para a data de vencimento do investimento."
            maturityDateTextField.accessibilityTraits = .searchField
        }
    }
    @IBOutlet weak var investmentCDIRateLabel: UILabel! {
        didSet {
            investmentCDIRateLabel.isAccessibilityElement = true
            investmentCDIRateLabel.accessibilityLabel = "Qual o percentual do CDI do investimento? *"
            investmentCDIRateLabel.accessibilityTraits = .staticText
        }
    }
    @IBOutlet weak var investmentCDIRateTextField: UITextField! {
        didSet {
            investmentCDIRateTextField.text = "120"
            investmentCDIRateTextField.delegate = self
            investmentCDIRateTextField.isAccessibilityElement = true
            investmentCDIRateTextField.accessibilityLabel = "Campo de texto para o percentual do CDI do investimento."
            investmentCDIRateTextField.accessibilityTraits = .searchField
            investmentCDIRateTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        }
    }
    @IBOutlet weak var simulateButton: UIButton! {
        didSet {
            simulateButton.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.7921568627, blue: 0.7882352941, alpha: 1)
            simulateButton.isAccessibilityElement = true
            simulateButton.accessibilityLabel = "Simular"
            simulateButton.accessibilityTraits = .button
        }
    }

    var investmentFormViewModel = InvestmentFormViewModel()
    weak var delegate: InvestmentFormViewProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func simulateButtonClicked(_ sender: UIButton) {
        if allTextFieldsFilled() {
            simulateButton.isEnabled = false
            guard let investedAmount = investedAmountTextField.text else { return }
            guard let rate = investmentCDIRateTextField.text else { return }
            guard let maturityDate = maturityDateTextField.text else { return }

            if let date = investmentFormViewModel.dateMask(from: maturityDate) {
                let requestParams = Request(investedAmount: investmentFormViewModel.replaceCommaForDot(at: investedAmount),
                                            rate: investmentFormViewModel.replaceCommaForDot(at: rate),
                                            maturityDate: date)

                let params = requestParams.params

                self.investmentFormViewModel.showLoading(on: self.simulateButton)
                APIInvestmentRepository.getInvestiment(params: params) { (result) in
                    self.clearTextFields()
                    if let result = result {
                        self.investmentFormViewModel.hideLoading(on: self.simulateButton)
                        self.delegate?.presentResultViewController(result: result)
                    } else {
                        self.delegate?.showAlertForRequestErorr()
                    }
                }
            } else {
                self.maturityDateTextField.text = ""
                self.delegate?.showAlertForWrongDateFormat()
            }
            simulateButton.isEnabled = true
        } else {
            delegate?.showAlertForEmptyTextFields()
        }
    }
}

extension InvestmentFormView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case investedAmountTextField:
            maturityDateTextField.becomeFirstResponder()
        case maturityDateTextField:
            investmentCDIRateTextField.becomeFirstResponder()
        case investmentCDIRateTextField:
            investmentCDIRateTextField.resignFirstResponder()
            if allTextFieldsFilled() {
                simulateButton.isEnabled = true
                simulateButtonClicked(UIButton())
            }
        default:
            break
        }
        return true
    }
}

extension InvestmentFormView {
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        if investedAmountTextField.hasText && maturityDateTextField.hasText {
            if textField.hasText {
                simulateButton.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.7843137255, blue: 0.7019607843, alpha: 1)
            } else {
                simulateButton.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.7921568627, blue: 0.7882352941, alpha: 1)
            }
        }
    }

    fileprivate func allTextFieldsFilled() -> Bool {
        if investedAmountTextField.hasText && maturityDateTextField.hasText && investmentCDIRateTextField.hasText {
            return true
        }
        return false
    }

    fileprivate func clearTextFields() {
        DispatchQueue.main.async(execute: {
            self.investedAmountTextField.text = ""
            self.maturityDateTextField.text = ""
            self.investmentCDIRateTextField.text = ""
        })
    }
}
