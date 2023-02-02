//
//  VC5.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 01.02.2023.
//

import UIKit

class VC5: UIViewController {
    
    //MARK: Properties
    private let redView = UIView.customView(color: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))
    private let greenView = UIView.customView(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    private let blueView = UIView.customView(color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    private let orangeView = UIView.customView(color: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1))
    
    private lazy var redViewY : NSLayoutConstraint = redView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    private lazy var greenViewX: NSLayoutConstraint = greenView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    private lazy var bluewViewX: NSLayoutConstraint = blueView.leadingAnchor.constraint(equalTo: self.view.trailingAnchor)
    private lazy var orangeViewX: NSLayoutConstraint = orangeView.trailingAnchor.constraint(equalTo: self.view.leadingAnchor)
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.redViewY.constant = 0
        let redAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.4) { self.view.layoutIfNeeded() }
        redAnimator.startAnimation()

        self.greenViewX.constant = 0
        let greenAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.3) { self.view.layoutIfNeeded() }
        greenAnimator.startAnimation(afterDelay: 0.5)

        self.bluewViewX.constant = 0
        let blueAnimator = UIViewPropertyAnimator(duration: 3, curve: .linear) { self.view.layoutIfNeeded() }
        blueAnimator.startAnimation(afterDelay: 0.5)
        
        self.orangeViewX.constant = 0
        let orangeAnimator = UIViewPropertyAnimator(duration: 3, curve: .linear) { self.view.layoutIfNeeded() }
        orangeAnimator.startAnimation(afterDelay: 0.5)
        orangeAnimator.addCompletion { finalPosition in self.orangeView.removeFromSuperview() }
    }

    
    //MARK: - SetupUI
    private func setupUI() {
        configureRedView()
        configureGreenView()
        configureBlueView()
        configureOrangeView()
    }

    private func configureRedView() {
        self.view.addSubview(redView)
        redViewY.constant = -300
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            redView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            redView.heightAnchor.constraint(equalToConstant: 100),
            redViewY
        ])
        self.view.layoutIfNeeded()
    }

    private func configureGreenView() {
        self.view.addSubview(greenView)
        greenViewX.constant = -400
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            greenView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            greenView.heightAnchor.constraint(equalToConstant: 70),
            greenViewX
        ])
        self.view.layoutIfNeeded()
    }
    
    private func configureBlueView() {
        self.view.addSubview(blueView)
        bluewViewX.constant = -600
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20),
            blueView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            blueView.heightAnchor.constraint(equalToConstant: 70),
            bluewViewX
        ])
        self.view.layoutIfNeeded()
    }
    
    private func configureOrangeView() {
        self.view.addSubview(orangeView)
        orangeViewX.constant = 600
        NSLayoutConstraint.activate([
            orangeView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 60),
            orangeView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            orangeView.heightAnchor.constraint(equalToConstant: 70),
            orangeViewX
        ])
        self.view.layoutIfNeeded()
    }
}
