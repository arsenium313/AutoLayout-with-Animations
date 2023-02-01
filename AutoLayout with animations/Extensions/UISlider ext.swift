//
//  UISlider.swift
//  AutoLayout
//
//  Created by Арсений Кухарев on 31.01.2023.
//

import UIKit

extension UISlider {
    
    static func customSlider(color: UIColor) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = color
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 0
        return slider
    }
    
}
