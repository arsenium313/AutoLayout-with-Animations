//
//  VC9.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 07.02.2023.
//

import UIKit

class VC9: UIViewController {
    
    //MARK: Properties
    private let rootView = UIView.customView(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    private let subview = UIView.customView(color: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    private lazy var rootViewLeading: NSLayoutConstraint = rootView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
    private lazy var rootViewTrailing: NSLayoutConstraint = rootView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
    private lazy var subviewTop: NSLayoutConstraint = subview.topAnchor.constraint(equalTo: rootView.layoutMarginsGuide.topAnchor)
    private lazy var subviewBottom: NSLayoutConstraint = subview.bottomAnchor.constraint(equalTo: rootView.layoutMarginsGuide.bottomAnchor)
    private lazy var subviewBigHeight: NSLayoutConstraint = subview.heightAnchor.constraint(equalTo: rootView.heightAnchor, multiplier: 0.4)
    private lazy var subviewSmallHeight: NSLayoutConstraint = subview.heightAnchor.constraint(equalTo: rootView.heightAnchor, multiplier: 0.2)
    
    private var isRootViewAdded = false
    private var isSubviewAdded = false
    
    private let rootViewDoesntExistMessage = "WTF? rootView doesn't exist!"
    private let rootViewAlreadyExistMessage = "WTF? rootView already exist!"
    private let subviewDoesntExistMessage = "WTF? subview doesn't exist!"
    private let subviewAlreadyExistMessage = "WTF? subview already exist!"
    
    private let addRootViewButton = UIButton.customButton(title: "Add rootView", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
    private let rootViewAddSubViewButton = UIButton.customButton(title: "RootView add subview", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
    private let rootViewRemoveFromSuperViewButton = UIButton.customButton(title: "RootView remove from superView", color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    private let subViewSizeChangeButton = UIButton.customButton(title: "SubView size change", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    private let subViewPositionChangeButton = UIButton.customButton(title: "SubView position change", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    private let rootViewPositionChangeButton = UIButton.customButton(title: "RootView position change", color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addRootViewButton, rootViewAddSubViewButton, rootViewRemoveFromSuperViewButton,
                                                       subViewSizeChangeButton, subViewPositionChangeButton, rootViewPositionChangeButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
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
        addTargetsToButtons()
    }
    
    private func configureStackView() {
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = self.view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: guide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25)
        ])
    }
    
    private func addTargetsToButtons() {
        addRootViewButton.addTarget(self, action: #selector(addRootView), for: .touchUpInside)
        rootViewAddSubViewButton.addTarget(self, action: #selector(rootViewAddSubView), for: .touchUpInside)
        rootViewRemoveFromSuperViewButton.addTarget(self, action: #selector(rootViewRemoveFromSuperView), for: .touchUpInside)
        subViewSizeChangeButton.addTarget(self, action: #selector(subViewSizeChange), for: .touchUpInside)
        subViewPositionChangeButton.addTarget(self, action: #selector(subViewPositionChange), for: .touchUpInside)
        rootViewPositionChangeButton.addTarget(self, action: #selector(rootViewPositionChange), for: .touchUpInside)
    }
    

    //MARK: - @objc
    @objc private func addRootView() {
        guard !isRootViewAdded else { print(rootViewAlreadyExistMessage); return }
        configureAddRootView()
    }
    
    @objc private func rootViewAddSubView() {
        guard isRootViewAdded else { print(rootViewDoesntExistMessage); return }
        guard !isSubviewAdded else { print(subviewAlreadyExistMessage); return }
        configureRootViewAddSubview()
    }
    
    @objc private func rootViewRemoveFromSuperView() {
        guard isRootViewAdded else { print(rootViewDoesntExistMessage); return }
        configureRootViewRemoveFromSuperView()
    }
    
    @objc private func subViewSizeChange() {
        guard isRootViewAdded else { print(rootViewDoesntExistMessage); return }
        guard isSubviewAdded else { print(subviewDoesntExistMessage); return }
        configureSubviewSizeChange()
    }
    
    @objc private func subViewPositionChange() {
        guard isRootViewAdded else { print(rootViewDoesntExistMessage); return }
        guard isSubviewAdded else { print(subviewDoesntExistMessage); return }
        configureSubviewPositionChange()
    }
    
    @objc private func rootViewPositionChange() {
        guard isRootViewAdded else { print(rootViewDoesntExistMessage); return }
        configureRootViewPositionChange()
    }
    
    
    //MARK: - Configure Views
    private func configureAddRootView() {
        self.view.addSubview(rootView)
        isRootViewAdded = true
        
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            rootView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            rootView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            rootViewLeading
        ])
    }
    
    private func configureRootViewAddSubview() {
        rootView.addSubview(subview)
        isSubviewAdded = true
        
        let guide = rootView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            subviewSmallHeight,
            subviewTop
        ])
    }
    
    private func configureRootViewRemoveFromSuperView() {
        subview.removeFromSuperview()
        rootView.removeFromSuperview()
        isRootViewAdded = false
        isSubviewAdded = false
    }
    
    private func configureSubviewSizeChange() {
        if subviewSmallHeight.isActive {
            subviewSmallHeight.isActive = false
            subviewBigHeight.isActive = true
        } else {
            subviewBigHeight.isActive = false
            subviewSmallHeight.isActive = true
        }
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func configureSubviewPositionChange() {
        if subviewTop.isActive {
            subviewTop.isActive = false
            subviewBottom.isActive = true
        } else {
            subviewBottom.isActive = false
            subviewTop.isActive = true
        }
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func configureRootViewPositionChange() {
        if rootViewLeading.isActive {
            rootViewLeading.isActive = false
            rootViewTrailing.isActive = true
        } else {
            rootViewTrailing.isActive = false
            rootViewLeading.isActive = true
        }
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    
}
