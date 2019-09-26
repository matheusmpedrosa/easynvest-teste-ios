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
            let investmentResultViewController = storyboard.instantiateViewController(withIdentifier: ViewControllers.kResultViewController) as? InvestmentResultViewController
            if let viewController = investmentResultViewController {
                viewController.result = result
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }

    func showAlertForEmptyTextFields() {
        self.presentAlertWithOptions(title: Alerts.kWaitTitle, message: Alerts.kWaitDescription, style: .alert, options: Alerts.kWaitOption) { (_) in
        }
    }

    func showAlertForRequestErorr() {
        self.presentAlertWithOptions(title: Alerts.kResquestTitle, message: Alerts.kResquestDescription, style: .alert, options: Alerts.kResquestOption) { (_) in
        }
    }

    func showAlertForWrongDateFormat() {
        self.presentAlertWithOptions(title: Alerts.kDateTitle, message: Alerts.kDateDescription, style: .alert, options: Alerts.kDateOption) { (_) in
        }
    }
}
