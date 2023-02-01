//
//  VC5.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 01.02.2023.
//

import UIKit

class VC5: UIViewController {

    private let button = UIButton.customButton(title: "BlackButton", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
    private lazy var y: NSLayoutConstraint = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.y.constant = 0
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        configureBlackButton()
    }

    private func configureBlackButton() {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
     
        y.constant = -200
     
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: 100),
            y
        ])
        
    }

}
