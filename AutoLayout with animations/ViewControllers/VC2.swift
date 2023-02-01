//
//  SquareVC.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 25.01.2023.
//

import UIKit

class VC2: UIViewController {

    private let redSlider = UISlider.customSlider(color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
    private let greenSlider = UISlider.customSlider(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    
    private let redView = UIView.customView(color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
    private let greenView = UIView.customView(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    
    private let squareSize: CGFloat = 70
    
    private lazy var slidersStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redSlider, greenSlider])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return stackView
    }()
    
    private lazy var redX: CGFloat = (self.view.frame.maxX - squareSize) / 10 * CGFloat(redSlider.value)
    private lazy var redY: CGFloat = self.view.frame.maxY / 4
    private lazy var greenX: CGFloat = (self.view.frame.maxX - squareSize) / 10 * CGFloat(greenSlider.value)
    private lazy var greenY: CGFloat = self.view.frame.maxY / 2
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupUI()
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
        greenSlider.addTarget(self, action: #selector(greenSliderAction(_:)), for: .valueChanged)
    }
    
    
    private func configureViews() {
        self.view.addSubview(redView)
        self.view.addSubview(greenView)
        
        redView.frame = CGRect(x: redX, y: redY, width: squareSize, height: squareSize)
        greenView.frame = CGRect(x: greenX, y: greenY, width: squareSize, height: squareSize)
    }
    
    
    //MARK: - @objc
    @objc private func redSliderAction(_ sender: UISlider) {
        redX = (self.view.frame.maxX - squareSize) / 10 * CGFloat(sender.value)
        self.redView.frame = CGRect(x: self.redX, y: self.redY, width: self.squareSize, height: self.squareSize)
        self.view.layoutIfNeeded()
    }
    
    @objc private func greenSliderAction(_ sender: UISlider) {
        greenX = (self.view.frame.maxX - squareSize) / 10 * CGFloat(sender.value)
        self.greenView.frame = CGRect(x: self.greenX, y: self.greenY, width: self.squareSize, height: self.squareSize)
        self.view.layoutIfNeeded()
    }
    
    
}
