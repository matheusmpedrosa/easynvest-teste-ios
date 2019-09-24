//
//  InvestmentResultView.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/21/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import UIKit

protocol InvestmentResultViewProtocol: class {
    func dismissInvestmentResultViewController()
}

class InvestmentResultView: UIView {

    @IBOutlet weak var investmentResultLabel: UILabel!
    @IBOutlet weak var investmentResultValueLabel: UILabel!
    @IBOutlet weak var profitabilityLabel: UILabel!
    @IBOutlet weak var profitabilityValueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.alwaysBounceVertical = false
            setupTableViewFooterView()
        }
    }
    var investmentResult: Investment? {
        didSet {
            
        }
    }
    var investmentResultViewController: InvestmentResultViewController? {
        didSet {
            investmentResultViewController?.delegate = self
        }
    }
    let investmentResultViewModel = InvestmentResultViewModel()
    var simulateAgainView: SimulateAgainView?
    weak var delegate: InvestmentResultViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension InvestmentResultView {
    func setupTableViewFooterView() {
        let frame = CGRect(x: 16, y: 0, width: UIScreen.main.bounds.width - 32, height: 50)
        simulateAgainView = SimulateAgainView(frame: frame, delegate: self)
        tableView.tableFooterView = simulateAgainView
    }
}

extension InvestmentResultView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell", for: indexPath)
        cell.selectionStyle = .none
        
        if let result = investmentResult {
            investmentResultViewModel.manageTableViewCells(cell: cell, indexPath: indexPath, result: result)
        }
        
        return cell
    }
}

extension InvestmentResultView: InvestmentResultViewControllerProtocol {
    func InvestmentResultViewDidLayoutSubviews() {
        if let result = investmentResult {
            investmentResultValueLabel.text = investmentResultViewModel.toBrazilianReal(double: result.grossAmount)
            profitabilityValueLabel.text = investmentResultViewModel.toBrazilianReal(double: result.grossAmountProfit)
        }
    }
}

extension InvestmentResultView: SimulateAgainViewProtocol {
    func dismissInvestmentResultViewController() {
        delegate?.dismissInvestmentResultViewController()
    }
}
