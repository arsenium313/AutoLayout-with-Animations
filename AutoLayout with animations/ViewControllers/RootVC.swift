//
//  RootVC.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 31.01.2023.
//

import UIKit


class RootVC: UIViewController {

    private let vc1Button = UIButton.customButton(title: "VC 1", color: #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1))
    private let vc2Button = UIButton.customButton(title: "VC 2", color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    private let vc3Button = UIButton.customButton(title: "VC 3", color: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
    private let vc4Button = UIButton.customButton(title: "VC 4", color: #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1))
    private let vc5Button = UIButton.customButton(title: "VC 5", color: #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1))
    private let vc6Button = UIButton.customButton(title: "VC 6", color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [vc1Button, vc2Button, vc3Button, vc4Button, vc5Button, vc6Button])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    //MARK: - View life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        configureStackView()
        configureButtonsSelectors()
    }
    
    private func configureStackView() {
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    private func configureButtonsSelectors() {
        vc1Button.addTarget(self, action: #selector(goToVC1), for: .touchUpInside)
        vc2Button.addTarget(self, action: #selector(goToVC2), for: .touchUpInside)
        vc3Button.addTarget(self, action: #selector(goToVC3), for: .touchUpInside)
        vc4Button.addTarget(self, action: #selector(goToVC4), for: .touchUpInside)
        vc5Button.addTarget(self, action: #selector(goToVC5), for: .touchUpInside)
        vc6Button.addTarget(self, action: #selector(goToVC6), for: .touchUpInside)
    }
    
    
    //MARK: - @objc
    @objc private func goToVC1() {
        let vcToGo = VC1()
        navigationController?.pushViewController(vcToGo, animated: true)
    }
    
    @objc private func goToVC2() {
        let vcToGo = VC2()
        navigationController?.pushViewController(vcToGo, animated: true)
    }
    
    @objc private func goToVC3() {
        let vcToGo = VC3()
        navigationController?.pushViewController(vcToGo, animated: true)
    }
    
    @objc private func goToVC4() {
        let vcToGo = VC4()
        navigationController?.pushViewController(vcToGo, animated: true)
    }
    
    @objc private func goToVC5() {
        let vcToGo = VC5()
        navigationController?.pushViewController(vcToGo, animated: true)
    }
    
    @objc private func goToVC6() {
        let vcToGo = VC6()
        navigationController?.pushViewController(vcToGo, animated: true)
    }
}
