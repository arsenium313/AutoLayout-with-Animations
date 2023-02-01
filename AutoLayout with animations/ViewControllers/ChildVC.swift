//
//  ChildVC.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 01.02.2023.
//

import UIKit

class ChildVC: UIViewController {
    
    private let view1 = UIView.customView(color: #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
    private let view2 = UIView.customView(color: #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1))
    private let view3 = UIView.customView(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    private let view4 = UIView.customView(color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
    
    private let viewSize: CGFloat = 50
    
    private lazy var tap1 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
    private lazy var tap2 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
    private lazy var tap3 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
    private lazy var tap4 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        setupUI()
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        configureViews()
    }

    private func configureViews() {
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
        self.view.addSubview(view4)
        
        view1.addGestureRecognizer(tap1)
        view2.addGestureRecognizer(tap2)
        view3.addGestureRecognizer(tap3)
        view4.addGestureRecognizer(tap4)
        
        self.view.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let guide = self.view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            view1.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            view1.topAnchor.constraint(equalTo: guide.topAnchor),
            view1.widthAnchor.constraint(equalToConstant: viewSize),
            view1.heightAnchor.constraint(equalToConstant: viewSize)
        ])
        
        NSLayoutConstraint.activate([
            view2.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            view2.topAnchor.constraint(equalTo: guide.topAnchor),
            view2.widthAnchor.constraint(equalToConstant: viewSize),
            view2.heightAnchor.constraint(equalToConstant: viewSize)
        ])
        
        NSLayoutConstraint.activate([
            view3.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            view3.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            view3.widthAnchor.constraint(equalToConstant: viewSize),
            view3.heightAnchor.constraint(equalToConstant: viewSize)
        ])
        
        NSLayoutConstraint.activate([
            view4.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            view4.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            view4.widthAnchor.constraint(equalToConstant: viewSize),
            view4.heightAnchor.constraint(equalToConstant: viewSize)
        ])
    }
    
    
    //MARK: - @objc
    @objc private func tapAction() {
        print("Tapped!")
    }
    
}
