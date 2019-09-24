//
//  InvestmentResultView.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/21/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import UIKit

class InvestmentResultView: UIView {

    @IBOutlet weak var investmentResultLabel: UILabel!
    @IBOutlet weak var investmentResultValueLabel: UILabel!
    @IBOutlet weak var profitabilityLabel: UILabel!
    @IBOutlet weak var profitabilityValueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var investmentResult: Investment?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError()
    }
}

extension InvestmentResultView {
    func setupTableView() {
        tableView.dataSource = self
    }
}

extension InvestmentResultView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
