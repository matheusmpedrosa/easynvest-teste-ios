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
        hideKeyboardWhenTappedAround()
    }
}

extension InvestmentFormViewController: InvestmentFormViewProtocol {
    func presentResultViewController(result: Investment) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let investmentResultViewController = storyboard.instantiateViewController(withIdentifier: "InvestmentResultViewController") as? InvestmentResultViewController
            if let viewController = investmentResultViewController {
                viewController.result = result
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
    func showAlertForEmptyTextFields() {
        self.presentAlertWithOptions(title: "Calma, jovem!", message: "Antes de simular o investimento, preencha corretamente todo o formulário.", style: .alert, options: "Tô calmo") { (option) in
        }
    }
    
    func showAlertForRequestErorr() {
        self.presentAlertWithOptions(title: "Ops...", message: "Algo deu errado na simulação. Tente novamente.", style: .alert, options: "Tudo bem") { (option) in
        }
    }
    
    func showAlertForWrongDateFormat() {
        self.presentAlertWithOptions(title: "Ops...", message: "Parece que a data inserida está incorreta. De preferência, escreva no formato \"dd/MM/yyyy\".", style: .alert, options: "Vou arrumar") { (option) in
        }
    }
}
