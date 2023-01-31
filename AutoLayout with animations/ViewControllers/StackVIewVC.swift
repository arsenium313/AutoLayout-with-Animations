//
//  StackVIewVC.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 30.01.2023.
//

import UIKit




class StackVIewVC: UIViewController {

    private enum ViewMetrics { //Инкапсуляция? что-бы переменные не валялись по коду сами по себе
        static let fontSize: CGFloat = 24.0
        static let spacing: CGFloat = 16.0
    }
    
    lazy var bigWidth: NSLayoutConstraint = redView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8)
    lazy var smallWidth: NSLayoutConstraint = redView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3)
    
    
    private let redButton = UIButton.customButton(tittle: "Red", color: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), fontSize: ViewMetrics.fontSize)
    private let greenButton = UIButton.customButton(tittle: "Green", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), fontSize: ViewMetrics.fontSize)
    private let blueButton = UIButton.customButton(tittle: "Blue", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), fontSize: ViewMetrics.fontSize)
    
    private let redView = UIView.customView(color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
    private let greenView = UIView.customView(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    private let blueView = UIView.customView(color: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    private lazy var switcherFirst: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = true
        switcher.addTarget(self, action: #selector(switcherAction), for: .valueChanged)
        switcher.thumbTintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        return switcher
    }()
    
    private lazy var switcherSecond: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.addTarget(self, action: #selector(switcherActionTwo), for: .valueChanged)
        switcher.thumbTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return switcher
    }()
    lazy var barItem: UITabBarItem = {
        let barItem = UITabBarItem()
        barItem.title = "Third"
        barItem.image = UIImage(named: "rectangle.fill")
        return barItem
    }()
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [switcherFirst, switcherSecond, childStackView])
        stackView.axis = .vertical
        stackView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 1, alpha: 0.1958040149)
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    
    private lazy var childStackView: UIStackView = {
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
        setupUI()
        title = "sdfdskl"
        self.tabBarItem = barItem
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        configureStackView()
        
        self.view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            redView.heightAnchor.constraint(equalToConstant: 200)
        ])
        bigWidth.isActive = true
    }

    private func configureStackView(){
        self.view.addSubview(rootStackView)
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rootStackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            rootStackView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            rootStackView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    
    //MARK: - @objc
    @objc private func switcherAction() {
        
        if switcherFirst.isOn {
            let animator = UIViewPropertyAnimator(duration: 1, curve: .easeOut) {
                self.rootStackView.axis = .vertical
                self.rootStackView.distribution = .fill
                self.rootStackView.alignment = .fill
            }
            animator.startAnimation()
        } else {
            let animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
                self.rootStackView.axis = .horizontal
                self.rootStackView.distribution = .equalSpacing
                self.rootStackView.alignment = .center
            }
            animator.startAnimation()
        }
    }
    
    @objc private func switcherActionTwo() {
        
        if switcherSecond.isOn {
            bigWidth.isActive = false
            smallWidth.isActive = true
            
            redView.addSubview(greenView)
            greenView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                greenView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
                greenView.centerYAnchor.constraint(equalTo: redView.centerYAnchor),
                greenView.widthAnchor.constraint(equalToConstant: 20),
                greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor)
            ])
            
           // self.view.layoutIfNeeded()
            
            self.view.addSubview(blueView)
            blueView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 20),
                blueView.topAnchor.constraint(equalTo: redView.topAnchor),
                blueView.widthAnchor.constraint(equalToConstant: 100),
                blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor)
            ])
            print(blueView.frame)
           // self.view.layoutIfNeeded()
        } else {
            bigWidth.isActive = true
            smallWidth.isActive = false
            blueView.removeFromSuperview()
            greenView.removeFromSuperview()
        }
        
        UIView.animate(withDuration: 1) {
           // self.view.layoutIfNeeded()
        }
    }
    
}
