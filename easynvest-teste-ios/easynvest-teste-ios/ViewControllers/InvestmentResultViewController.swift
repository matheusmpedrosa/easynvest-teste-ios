//
//  InvestmentResultViewController.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/21/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import UIKit

protocol InvestmentResultViewControllerProtocol: class {
    func InvestmentResultViewDidLayoutSubviews()
}

class InvestmentResultViewController: UIViewController {
    
    @IBOutlet weak var mainView: InvestmentResultView! {
        didSet {
            if let view = mainView, let result = result {
                view.investmentResult = result
                view.investmentResultViewController = self
            }
        }
    }
    var result: Investment?
    weak var delegate: InvestmentResultViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        delegate?.InvestmentResultViewDidLayoutSubviews()
    }
}


