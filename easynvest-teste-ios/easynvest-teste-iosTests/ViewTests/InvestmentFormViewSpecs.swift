//
//  InvestmentFormViewSpecs.swift
//  easynvest-teste-iosTests
//
//  Created by Matheus Pedrosa on 9/26/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import easynvest_teste_ios

class InvestmentFormViewSpecs: QuickSpec {
    override func spec() {
        var sut: InvestmentFormView!
        describe("The 'InvestmentFormView'") {
            context("Does match correct type") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    sut = InvestmentFormView()
                }
                it("is a type of InvestmentFormView") {
                    expect(sut).to(beAKindOf(InvestmentFormView.self))
                }
                it("does exist") {
                    expect(sut).toNot(beNil())
                }
            }
        }
        describe("The 'InvestmentFormView'") {
            context("Functions tests") {
                afterEach {
                    sut.investedAmountTextField.text = ""
                    sut.maturityDateTextField.text = ""
                    sut.investmentCDIRateTextField.text = ""
                    sut = nil
                }
                beforeEach {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(identifier: ViewControllers.kFormViewController) as? InvestmentFormViewController
                    viewController?.beginAppearanceTransition(true, animated: false)
                    viewController?.endAppearanceTransition()
                    sut = viewController?.mainView
                    sut.investedAmountTextField.text = "1000.0"
                    sut.maturityDateTextField.text = "14/06/2022"
                    sut.investmentCDIRateTextField.text = "120"
                }
                it("simulate button touched") {
                    sut.simulateButtonClicked(UIButton())
                }
                it("simulate button touched when text fileds have no text") {
                    sut.investedAmountTextField.text = ""
                    sut.maturityDateTextField.text = ""
                    sut.investmentCDIRateTextField.text = ""
                    sut.simulateButtonClicked(UIButton())
                }
                it("simulate button touched when maturityDate has wrong format") {
                    sut.maturityDateTextField.text = "9999999"
                    sut.simulateButtonClicked(UIButton())
                }
                it("textFieldShouldReturn") {
                    expect(sut.textFieldShouldReturn(UITextField())).to(be(true))
                }
                it("textFieldDidChange") {
                    sut.textFieldDidChange(UITextField())
                }
            }
        }
    }
}
