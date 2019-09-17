//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

enum TextFieldProp: StylingProp {
    typealias T = UITextField
    case border(_ width: CGFloat)
    case cornerRadius(_ radius: CGFloat)
    case borderColor(_ color: UIColor)
    case backgroundColor(_ color: UIColor)
    case textColor(_ color: UIColor)
    case font(_ font: UIFont)
    case align(_: NSTextAlignment)
    case placeHolder(_ text: String)
    case leftPadding(_ amount: CGFloat)
    case autoCapitalization(_ capitalType: UITextAutocapitalizationType)
    
    func bind(to textField: UITextField) {
        switch self {
            case .border(let width):
                textField.layer.borderWidth = width
            case .cornerRadius(let radius):
                textField.layer.cornerRadius = radius
            case .borderColor(let color):
                textField.layer.borderColor = color.cgColor
            case .backgroundColor(let color):
                textField.backgroundColor = color
            case .textColor(let color):
                textField.textColor = color
            case .font(let font):
                textField.font = font
            case .align(let alignment):
                textField.textAlignment = alignment
            case .placeHolder(let text):
                textField.attributedPlaceholder = NSAttributedString(string: text,
                                                                     attributes: [NSAttributedString.Key.font : Fonts.System_Placeholder])
                textField.placeholder = text
            case .leftPadding(let amount):
                textField.setLeftPaddingPoints(amount)
            case .autoCapitalization(let capitalType):
                textField.autocapitalizationType = capitalType
        }
    }
}

extension UITextField {
    func setProps(_ props: TextFieldProp...) {
        props.forEach { $0.bind(to: self) }
    }
}
