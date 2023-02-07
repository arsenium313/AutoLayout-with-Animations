//
//  VC8.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 03.02.2023.
//

import UIKit

class VC8: UIViewController {
    
    //MARK: Properties
    private lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentSize = contentSize
        return scroll
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4, view5, view6, view7, view8, view9, view10])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let view1 = UIView.customView(color: #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1))
    private let view2 = UIView.customView(color: #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1))
    private let view3 = UIView.customView(color: #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1))
    private let view4 = UIView.customView(color: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1))
    private let view5 = UIView.customView(color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
    private let view6 = UIView.customView(color: #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
    private let view7 = UIView.customView(color: #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1))
    private let view8 = UIView.customView(color: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1))
    private let view9 = UIView.customView(color: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1))
    private let view10 = UIView.customView(color: #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1))
    
    private lazy var contentSize = CGSize(width: self.view.frame.width, height: 1100) // count * (height + spacing)
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        configureScroll()
        configureContentView()
        configureStackView()
    }
    
    private func configureScroll() {
        self.view.addSubview(scroll)
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureContentView() {
        scroll.addSubview(contentView)
    }
    
    private func configureStackView() {
        contentView.addSubview(stackView)
        stackView.frame = contentView.bounds
        
        for view in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: contentSize.width),
                view.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
    }
 

}
