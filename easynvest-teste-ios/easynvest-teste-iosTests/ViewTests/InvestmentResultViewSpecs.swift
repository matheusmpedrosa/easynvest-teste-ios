//
//  InvestmentResultViewSpecs.swift
//  easynvest-teste-iosTests
//
//  Created by Matheus Pedrosa on 9/27/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import easynvest_teste_ios

class InvestmentResultViewSpecs: QuickSpec {
    override func spec() {
        var sut: InvestmentResultView!
        describe("'The InvestmentResultView'") {
            context("Does match correct type") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    sut = InvestmentResultView()
                }
                it("is a type of InvestmentResultView") {
                    expect(sut).to(beAKindOf(InvestmentResultView.self))
                }
                it("does exist") {
                    expect(sut).toNot(beNil())
                }
            }
        }
        describe("'The InvestmentResultView'") {
            context("Can show the correct labels text") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(identifier: ViewControllers.kResultViewController) as? InvestmentResultViewController
                    viewController?.beginAppearanceTransition(true, animated: false)
                    viewController?.endAppearanceTransition()
                    sut = viewController?.mainView
                    if let path = Bundle.main.path(forResource: "easynvest_simulator_response", ofType: "json") {
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            if let investmentDTO = try? decoder.decode(InvestmentDTO.self, from: data) {
                                sut.investmentResult = InvestmentDTOMapper.map(investmentDTO)
                            }
                        } catch let error {
                            print("Error: \(error)")
                            fail("Problem parsing JSON")
                        }
                    }
                }
                it("show the corret text for investmentResultValueLabel") {
                    sut.investmentResultViewDidLayoutSubviews()
                    expect(sut.investmentResultValueLabel.text).to(equal("R$ 60.528,20"))
                }
                it("show the corret text for profitabilityValueLabel") {
                    sut.investmentResultViewDidLayoutSubviews()
                    expect(sut.profitabilityValueLabel.text).to(equal("R$ 28.205,20"))
                }
                it("tableView cellForRowAt and toBrazilianReal function") {
                    sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                }
                it("tableView cellForRowAt and convertDate function") {
                    sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 6, section: 0))
                }
            }
        }
    }
}
