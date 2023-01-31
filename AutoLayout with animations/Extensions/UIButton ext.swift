//
//  UIButton.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 31.01.2023.
//

import UIKit

extension UIButton {
    
    static func customButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.backgroundColor = color
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        return button
    }
    
}

extension UIButton { //если создавать много одинаковых объектов, проще сделать расширение и создавать через функцию
    static func customButton(tittle: String, color: UIColor, fontSize: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(tittle, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return button
    }
}
