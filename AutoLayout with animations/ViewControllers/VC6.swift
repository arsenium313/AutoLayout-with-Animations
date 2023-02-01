//
//  VC6.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 01.02.2023.
//

import UIKit

class VC6: UIViewController {

    private let parentView = UIView.customView(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    private let childVC = ChildVC()
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }
    

    //MARK: - SetupUI
    private func setupUI() {
        configureParentView()
        configureChildVC()
    }
    
    private func configureParentView() {
        self.view.addSubview(parentView)
        
        let guide = self.view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            parentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            parentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            parentView.topAnchor.constraint(equalTo: guide.topAnchor),
            parentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
    
    private func configureChildVC() {
        self.addChild(childVC)
        parentView.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        childVC.view.frame = parentView.bounds
        parentView.layoutIfNeeded()
    }
    
    
    //MARK: - @objc
}
