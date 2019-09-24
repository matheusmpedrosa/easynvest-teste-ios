//
//  InvestmentFormViewController.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/21/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import UIKit

class InvestmentFormViewController: UIViewController {
    
    @IBOutlet weak var mainView: InvestmentFormView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
}

extension InvestmentFormViewController: InvestmentFormViewProtocol {
    func presentResultViewController(result: Investment) {
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = sb.instantiateViewController(withIdentifier: "InvestmentResultViewController")
        show(vc, sender: nil)
//        present(vc, animated: true, completion: nil)
    }
}
