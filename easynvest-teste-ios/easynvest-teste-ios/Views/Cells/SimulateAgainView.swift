//
//  SimulateAgainView.swift
//  easynvest-teste-ios
//
//  Created by Matheus Pedrosa on 9/24/19.
//  Copyright © 2019 M2P. All rights reserved.
//

import UIKit

protocol SimulateAgainViewProtocol: class {
    func dismissInvestmentResultViewController()
}

class SimulateAgainView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var simulateButton: UIButton! {
        didSet {
            simulateButton.isAccessibilityElement = true
            simulateButton.accessibilityLabel = Labels.kSimulateAgainButton
            simulateButton.accessibilityTraits = .button
        }
    }
    weak var delegate: SimulateAgainViewProtocol?

    required init(frame: CGRect, delegate: SimulateAgainViewProtocol) {
        super.init(frame: frame)
        self.delegate = delegate
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func simulateAgainButtonTouched(_ sender: Any) {
        delegate?.dismissInvestmentResultViewController()
    }
}

extension SimulateAgainView {
    func setup() {
        Bundle.main.loadNibNamed(Views.kSimulateAgainView, owner: self, options: nil)
        contentView.frame = bounds
        self.addSubview(contentView)
    }
}
