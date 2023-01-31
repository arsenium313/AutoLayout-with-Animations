//
//  UIView.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 31.01.2023.
//

import UIKit

extension UIView {
    
    static func customView(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
    
}


