//
//  SimulateAgainViewSpecs.swift
//  easynvest-teste-iosTests
//
//  Created by Matheus Pedrosa on 9/28/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import easynvest_teste_ios

class SimulateAgainViewSpecs: QuickSpec {
    override func spec() {
        var sut: SimulateAgainView!
        describe("The 'SimulateAgainView'") {
            afterEach {
                sut = nil
            }
            beforeEach {
                sut = SimulateAgainView(frame: CGRect(), delegate: InvestmentResultView())
            }
            context("Functions tests") {
                it("simulateAgainButtonTouched") {
                    sut.simulateAgainButtonTouched(UIButton())
                }
            }
        }
    }
}
