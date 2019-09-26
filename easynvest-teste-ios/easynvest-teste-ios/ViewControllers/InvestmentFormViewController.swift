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
            let investmentResultViewController = storyboard.instantiateViewController(withIdentifier: ViewController.resultViewController) as? InvestmentResultViewController
            if let viewController = investmentResultViewController {
                viewController.result = result
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }

    func showAlertForEmptyTextFields() {
        self.presentAlertWithOptions(title: Alert.kWaitTitle, message: Alert.kWaitDescription, style: .alert, options: Alert.kWaitOption) { (_) in
        }
    }

    func showAlertForRequestErorr() {
        self.presentAlertWithOptions(title: Alert.kResquestTitle, message: Alert.kResquestDescription, style: .alert, options: Alert.kResquestOption) { (_) in
        }
    }

    func showAlertForWrongDateFormat() {
        self.presentAlertWithOptions(title: Alert.kDateTitle, message: Alert.kDateDescription, style: .alert, options: Alert.kDateOption) { (_) in
        }
    }
}
