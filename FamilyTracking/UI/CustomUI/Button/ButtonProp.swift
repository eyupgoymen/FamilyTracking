//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

enum ButtonProp: StylingProp {
    typealias T = UIButton
    case title(_ title: String)
    case border(_ width: CGFloat)
    case cornerRadius(_ radius: CGFloat)
    case borderColor(_ color: UIColor)
    case backgroundColor(_ color: UIColor)
    case textColor(_ color: UIColor)
    case font(_ font: UIFont)
    case image(_ image: UIImage)

    func bind(to button: UIButton) {
        switch self {
            case .title(let title):
                button.setTitle(title, for: .normal)
            case .border(let width):
                button.layer.borderWidth = width
            case .cornerRadius(let radius):
                button.layer.cornerRadius = radius
            case .borderColor(let color):
                button.layer.borderColor = color.cgColor
            case .backgroundColor(let color):
                button.backgroundColor = color
            case .textColor(let color):
                button.setTitleColor(color, for: .normal)
            case .font(let font):
                button.titleLabel?.font = font
            case .image(let image):
                button.setImage(image, for: .normal)
        }
    }
}

extension UIButton {
    func setProps(_ props: ButtonProp...) {
        props.forEach { $0.bind(to: self) }
    }
}
