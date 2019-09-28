//
//  InvestmentFormViewControllerSpecs.swift
//  easynvest-teste-iosTests
//
//  Created by Matheus Pedrosa on 9/26/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import easynvest_teste_ios

class InvestmentFormViewControllerSpecs: QuickSpec {
    override func spec() {
        var sut: InvestmentFormViewController!
        describe("The 'InvestmentFormViewController'") {
            afterEach {
                sut = nil
            }
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                sut = storyboard.instantiateViewController(identifier: ViewControllers.kFormViewController) as? InvestmentFormViewController
                _ = sut.view
            }
            context("Does math correct type") {
                it("is a type of InvestmentFormViewController") {
                    expect(sut).to(beAKindOf(InvestmentFormViewController.self))
                }
                it("does exist") {
                    expect(sut).toNot(beNil())
                }
            }
            context("mainView") {
                it("mainView is of type InvestmentFormView") {
                    expect(sut.mainView).to(beAKindOf(InvestmentFormView.self))
                }
                it("mainView daes exists") {
                    expect(sut.mainView).toNot(beNil())
                }
            }
        }
    }
}
