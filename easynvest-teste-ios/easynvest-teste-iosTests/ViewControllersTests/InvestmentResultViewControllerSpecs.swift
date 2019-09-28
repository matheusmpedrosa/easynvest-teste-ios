//
//  InvestmentResultViewControllerSpecs.swift
//  easynvest-teste-iosTests
//
//  Created by Matheus Pedrosa on 9/28/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import easynvest_teste_ios

class InvestmentResultViewControllerSpecs: QuickSpec {
    override func spec() {
        var sut: InvestmentResultViewController!
        describe("The 'InvestmentResultViewController'") {
            afterEach {
                sut = nil
            }
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                sut = storyboard.instantiateViewController(identifier: ViewControllers.kResultViewController) as? InvestmentResultViewController
                _ = sut.view
            }
            context("Does math correct type") {
                it("is a type of InvestmentResultViewController") {
                    expect(sut).to(beAKindOf(InvestmentResultViewController.self))
                }
                it("does exist") {
                    expect(sut).toNot(beNil())
                }
            }
            context("mainView") {
                it("mainView is of type InvestmentResultView") {
                    expect(sut.mainView).to(beAKindOf(InvestmentResultView.self))
                }
                it("mainView daes exists") {
                    expect(sut.mainView).toNot(beNil())
                }
            }
            context("Function tests") {
                it("dismissInvestmentResultViewController") {
                    sut.dismissInvestmentResultViewController()
                }
                it("viewDidLayoutSubviews") {
                    sut.viewDidLayoutSubviews()
                }
            }
        }
    }
}
