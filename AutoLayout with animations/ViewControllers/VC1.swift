//
//  ViewController.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 24.01.2023.
//

import UIKit

class VC1: UIViewController {
    
    private let parentView: TwoSquareView = {
        let view = TwoSquareView()
        view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        return view
    }()
    
    private let animationSwitcher: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = true
        return switcher
    }()
    
    private lazy var smallWidth: NSLayoutConstraint = parentView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4)
    private lazy var bigWidth: NSLayoutConstraint = parentView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)

    
    //MARK: - View Lfe Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    //MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title = "Circle VC"
        setupParentView()
        setupSwitcher()
    }
    
    private func setupParentView() {
        self.view.addSubview(parentView)
        NSLayoutConstraint.activate([
            parentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            parentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            parentView.heightAnchor.constraint(equalTo: self.parentView.widthAnchor)
        ])
        checkSwitch() // ширина и радиус углов зависит от позиции переключателя
    }
    
    private func setupSwitcher() {
        self.view.addSubview(animationSwitcher)
        animationSwitcher.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationSwitcher.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            animationSwitcher.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        
        animationSwitcher.addTarget(self, action: #selector(parentViewChangeSize), for: .valueChanged)
    }

    
    //MARK: - @objc
    @objc private func parentViewChangeSize() {
        checkSwitch()
    }
    
    private func checkSwitch() {
        if animationSwitcher.isOn {
           toBigSquare()
        } else {
           toSmallCircle()
        }
    }
    
    private func toSmallCircle() {
        UIView.animate(withDuration: 1) {
            self.bigWidth.isActive = false
            self.smallWidth.isActive = true
            self.view.layoutIfNeeded()
            
            self.parentView.layer.cornerRadius =  self.parentView.frame.width / 2
            self.parentView.redView.layer.cornerRadius = self.parentView.redView.frame.width / 2
            self.parentView.greenView.layer.cornerRadius = self.parentView.greenView.frame.width / 2
        }
        
    }
    
    private func toBigSquare() {
        UIView.animate(withDuration: 1) {
            self.bigWidth.isActive = true
            self.smallWidth.isActive = false
            self.view.layoutIfNeeded()
            
            self.parentView.layer.cornerRadius =  .zero
            self.parentView.redView.layer.cornerRadius = .zero
            self.parentView.greenView.layer.cornerRadius = .zero
        }
        
    }
    
    
}
