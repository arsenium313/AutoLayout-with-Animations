//
//  StackVIewVC.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 30.01.2023.
//

import UIKit


class VC4: UIViewController {

    private enum ViewMetrics { //Инкапсуляция? что-бы переменные не валялись по коду сами по себе
        static let fontSize: CGFloat = 24.0
        static let spacing: CGFloat = 16.0
    }

    private let redButton = UIButton.customButton(title: "Red", color: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), fontSize: ViewMetrics.fontSize)
    private let greenButton = UIButton.customButton(title: "Green", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), fontSize: ViewMetrics.fontSize)
    private let blueButton = UIButton.customButton(title: "Blue", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), fontSize: ViewMetrics.fontSize)
    
    private lazy var switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = true
        switcher.addTarget(self, action: #selector(switcherAction(_:)), for: .valueChanged)
        switcher.thumbTintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        stackView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        stackView.axis = .horizontal // Ось
        stackView.spacing = ViewMetrics.spacing
        stackView.distribution = .fillEqually // расположение вдоль оси
        stackView.alignment = .fill // расположение перпендикулярно оси
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stackView
    }()
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        configureStackView()
        configureSwitcher()
    }

    private func configureStackView(){
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func configureSwitcher() {
        self.view.addSubview(switcher)
        
        NSLayoutConstraint.activate([
            switcher.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            switcher.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    
    //MARK: - @objc
    @objc private func switcherAction(_ sender: UISwitch ) {
        if sender.isOn {
            inHorizontalAxis()
        } else {
            inVerticalAxis()
        }
    }
    
    private func inHorizontalAxis() {
        let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.6) {
            self.stackView.axis = .horizontal
            self.stackView.distribution = .fillEqually
            self.stackView.alignment = .fill
        }
        animator.startAnimation()
    }
    
    private func inVerticalAxis() {
        let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.6) {
            self.stackView.axis = .vertical
            self.stackView.distribution = .fillEqually
            self.stackView.alignment = .fill
        }
        animator.startAnimation()
    }
}
