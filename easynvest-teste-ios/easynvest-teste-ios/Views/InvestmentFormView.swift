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
        }
    }
    @IBOutlet weak var simulateButton: UIButton! {
        didSet {
            simulateButton.isEnabled = false
        }
    }
    
    @IBAction func simulateButtonClicked(_ sender: UIButton) {
        if allTextFieldsFilled() {
            guard let investedAmount = investedAmountTextField.text else { return }
            guard let rate = investmentCDIRateTextField.text else { return }
            guard let maturityDate = maturityDateTextField.text else { return }
            
            let investmentFormViewModel = InvestmentFormViewModel(investedAmount: investedAmount, rate: rate, maturityDate: maturityDate)
            let params = investmentFormViewModel.params
            
            APIInvestmentRepository.getInvestiment(params: params) { (result) in
                if let result = result {
                    print("🏳️‍🌈 SUCCESS!!! \n \(result)")
                } else {
                    //show alert for request error
                }
            }
        } else {
            //show alert to fill textfields
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if allTextFieldsFilled() {
            simulateButton.isEnabled = true
        } else {
            simulateButton.isEnabled = false
        }
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == maturityDateTextField {
//            return Mask
//        }
//    }
}

extension InvestmentFormView {
    func allTextFieldsFilled() -> Bool {
        if investedAmountTextField.hasText && investmentCDIRateTextField.hasText && investmentCDIRateTextField.hasText {
            return true
        }
        return false
    }
}
