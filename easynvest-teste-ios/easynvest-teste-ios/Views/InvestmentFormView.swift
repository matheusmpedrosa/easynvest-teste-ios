//
//  InvestmentFormView.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/21/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import UIKit

class InvestmentFormView: UIView {

    @IBOutlet weak var investedAmountLabel: UILabel!
    @IBOutlet weak var investedAmountTextField: UITextField! {
        didSet {
            investedAmountTextField.delegate = self
        }
    }
    @IBOutlet weak var maturityDateLabel: UILabel!
    @IBOutlet weak var maturityDateTextField: UITextField! {
        didSet {
            maturityDateTextField.delegate = self
        }
    }
    @IBOutlet weak var investmentCDIRateLabel: UILabel!
    @IBOutlet weak var investmentCDIRateTextField: UITextField! {
        didSet {
            investmentCDIRateTextField.delegate = self
            investmentCDIRateTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        }
    }
    @IBOutlet weak var simulateButton: UIButton! {
        didSet {
            simulateButton.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.7921568627, blue: 0.7882352941, alpha: 1)
        }
    }
    
    var investmentFormViewModel = InvestmentFormViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func simulateButtonClicked(_ sender: UIButton) {
        if allTextFieldsFilled() {
            guard let investedAmount = investedAmountTextField.text else { return }
            guard let rate = investmentCDIRateTextField.text else { return }
            guard let maturityDate = maturityDateTextField.text else { return }
            
            let requestParams = Request(investedAmount: investedAmount,
                                        rate: rate,
                                        maturityDate: investmentFormViewModel.dateMask(from: maturityDate))
            
            let params = requestParams.params
            
            APIInvestmentRepository.getInvestiment(params: params) { (result) in
                if let result = result {
                    print("🏳️‍🌈 SUCCESS!!! \n \(result)")
                } else {
                    //show alert for request error
                }
            }
        } else {
            //show alert to fill textfields
            print("🏳️‍🌈 show alert to fill textfields")
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
    @objc func textFieldDidChange(_ textField: UITextField) {
        if investedAmountTextField.hasText && maturityDateTextField.hasText {
            if textField.text != "" {
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
}
