//
//  VC7.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 02.02.2023.
//

import UIKit

class VC7: UIViewController {

    //MARK: Properties
    private let redView = UIView.customView(color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
    private let blueView = UIView.customView(color: #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))
    private let startButton = UIButton.customButton(title: "Size change", color: #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1))
    
    private lazy var bigWidth = self.view.frame.width * 0.8
    private lazy var smallWidth = self.view.frame.width * 0.1
    
    private lazy var redViewWidth: NSLayoutConstraint = redView.widthAnchor.constraint(equalToConstant: bigWidth)
    private lazy var blueViewWidth: NSLayoutConstraint = blueView.widthAnchor.constraint(equalToConstant: smallWidth)
    
    private var isRedBig = true
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        configureButton()
        configureRedView()
        configureBlueView()
    }
    
    private func configureButton() {
        self.view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
        let guide = self.view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: guide.topAnchor),
            startButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            startButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configureRedView() {
        self.view.addSubview(redView)
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 100),
            redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            redView.heightAnchor.constraint(equalTo: redView.widthAnchor),
            redViewWidth
        ])
    }
    
    private func configureBlueView() {
        self.view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: redView.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor),
            blueViewWidth
        ])
    }
    
    //MARK: - @objc
    @objc private func startButtonAction() {
        if isRedBig {
            redViewWidth.constant = smallWidth
            blueViewWidth.constant = bigWidth
        } else {
            redViewWidth.constant = bigWidth
            blueViewWidth.constant = smallWidth
        }
        isRedBig.toggle()
        
        let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.6) {
            self.view.layoutIfNeeded()
        }
        animator.startAnimation()
    }
    
}
