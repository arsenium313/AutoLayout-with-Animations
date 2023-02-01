//
//  VC3.swift
//  AutoLayout with animations
//
//  Created by Арсений Кухарев on 31.01.2023.
//

import UIKit

class VC3: UIViewController {
    
    private let redSlider = UISlider.customSlider(color: #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1))
    private let blueSlider = UISlider.customSlider(color: #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1))
    private let brownSlider = UISlider.customSlider(color: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
    
    
    private let redView = UIView.customView(color: #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1))
    private let blueView = UIView.customView(color: #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1))
    private let brownView = UIView.customView(color: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
    
    private let squareSize: CGFloat = 70
    
    private lazy var slidersStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redSlider, blueSlider, brownSlider])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return stackView
    }()
    
    private lazy var redLeadingConstant: CGFloat = (self.view.frame.maxX - squareSize) / 10 * CGFloat(redSlider.value)
    private lazy var blueLeadingConstant: CGFloat = (self.view.frame.maxX - squareSize) / 10 * CGFloat(blueSlider.value)
    private lazy var brownLeadingConstant: CGFloat = (self.view.frame.maxX - squareSize) / 10 * CGFloat(brownSlider.value)
    private lazy var brownTopConstant: CGFloat = 0
    
    private lazy var redLeading: NSLayoutConstraint = redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: redLeadingConstant)
    private lazy var blueLeading: NSLayoutConstraint = blueView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: blueLeadingConstant)
    private lazy var brownLeading: NSLayoutConstraint = brownView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: brownLeadingConstant)
    private lazy var brownTop: NSLayoutConstraint = brownView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: brownTopConstant)
    
    private var brownYTotalPath: CGFloat = 0
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // находим расстояние на которое нужно передвигать brownView
        // выполняется много раз, поэтому проверем если етсь значение не выполняем, self.view.safeAreaInsets.top не имеет значения при первом вызове функции
        if brownYTotalPath.isZero && !self.view.safeAreaInsets.top.isZero {
            brownYTotalPath = slidersStackView.frame.minY - self.view.safeAreaInsets.top - squareSize
        }
    }
    
    
    //MARK: - Setup UI
    private func setupUI() {
        configureSlidersStackView()
        configureSliders()
        configureViews()
    }
    
    private func configureSlidersStackView() {
        self.view.addSubview(slidersStackView)
        slidersStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slidersStackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            slidersStackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            slidersStackView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            slidersStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureSliders() {
        redSlider.addTarget(self, action: #selector(redSliderAction(_:)), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(blueSliderAction(_:)), for: .valueChanged)
        brownSlider.addTarget(self, action: #selector(brownSliderAction(_:)), for: .valueChanged)
    }
    
    private func configureViews() {
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        self.view.addSubview(brownView)
        
        NSLayoutConstraint.activate([
           redView.widthAnchor.constraint(equalToConstant: squareSize),
           redView.heightAnchor.constraint(equalToConstant: squareSize),
           redView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 250),
           redLeading
        ])
        
        NSLayoutConstraint.activate([
           blueView.widthAnchor.constraint(equalToConstant: squareSize),
           blueView.heightAnchor.constraint(equalToConstant: squareSize),
           blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 30),
           blueLeading
        ])
   
        NSLayoutConstraint.activate([
            brownView.widthAnchor.constraint(equalToConstant: squareSize),
            brownView.heightAnchor.constraint(equalToConstant: squareSize),
            brownLeading,
            brownTop
        ])
    }
    
    
    //MARK: - @objc
    @objc private func redSliderAction(_ sender: UISlider) {
        redLeadingConstant = (self.view.frame.maxX - squareSize) / 10 * CGFloat(sender.value)
        self.redLeading.constant = self.redLeadingConstant
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func blueSliderAction(_ sender: UISlider) {
        blueLeadingConstant = (self.view.frame.maxX - squareSize) / 10 * CGFloat(sender.value)
        blueLeading.constant = blueLeadingConstant
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }

    @objc private func brownSliderAction(_ sender: UISlider) {
        brownTopConstant = brownYTotalPath / 10 * CGFloat(sender.value)
        brownTop.constant = brownTopConstant
        
        brownLeadingConstant = (self.view.frame.maxX - squareSize) / 10 * CGFloat(sender.value)
        brownLeading.constant = brownLeadingConstant
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
