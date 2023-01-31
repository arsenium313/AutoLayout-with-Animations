//
//  ParentView.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 25.01.2023.
//

import UIKit


class TwoSquareView: UIView {

    let redView = UIView.customView(color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
    let greenView = UIView.customView(color: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1))
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - SetupUI
    private func setupUI() {
        
        let leadingGuide = UILayoutGuide() // виртуальные невидимые view, которые используют как заглушки и болванки
        let trailingGuide = UILayoutGuide()
        let centerGuide = UILayoutGuide()
        
        self.addLayoutGuide(leadingGuide)
        self.addLayoutGuide(trailingGuide)
        self.addLayoutGuide(centerGuide)
        
        addSubview(redView)
        addSubview(greenView)
    
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10) //внутренние рамки
        
        NSLayoutConstraint.deactivate([
            redView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            redView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            redView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            redView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.deactivate([
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            greenView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            greenView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([ // получается view c одинаковой шириной между subView
            leadingGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leadingGuide.trailingAnchor.constraint(equalTo: redView.leadingAnchor),

            redView.trailingAnchor.constraint(equalTo: centerGuide.leadingAnchor),
            centerGuide.trailingAnchor.constraint(equalTo: greenView.leadingAnchor),

            greenView.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor),
            trailingGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            redView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            greenView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            redView.heightAnchor.constraint(equalTo: redView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor),
            
            leadingGuide.widthAnchor.constraint(equalTo: centerGuide.widthAnchor),
            leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor),
            
            redView.widthAnchor.constraint(equalTo: greenView.widthAnchor),
            greenView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
    }

    
}
