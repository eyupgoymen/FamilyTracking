//
//  TextFieldStyle.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

enum TextFieldStyle {
    case none
    case popup(_ placeHolder: String)
    
    private var style: Style<TextFieldProp> {
        switch self {
            case .popup(let placeHolder):
                return .with(
                    .backgroundColor(UIColor.black.withAlphaComponent(0.1)),
                    .cornerRadius(8),
                    .align(.left),
                    .placeHolder(placeHolder),
                    .font(Fonts.System_Placeholder),
                    .leftPadding(4),
                    .autoCapitalization(.none)
                )
            default:
                return Style()
        }
    }

    func install(to label: UITextField) {
        style.install(to: label)
    }
}
