//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

enum ButtonStyle {
    case dark(title: String)
    case yellow
    case familyInfo
    case none
    case popupSend

    private var style: Style<ButtonProp> {
        switch self {
            case .dark(let title):
                return .with(
                    .title(title),
                    .backgroundColor(Colors.darkButtonColor),
                    .cornerRadius(8),
                    .textColor(.white),
                    .font(Fonts.System_Button)
                )
            case .yellow:
                return .with(
                    .title("Join"),
                    .backgroundColor(Colors.yellowButtonColor),
                    .cornerRadius(8),
                    .textColor(Colors.yellowButtonTextColor),
                    .font(Fonts.System_Button)
                )
            case .familyInfo:
                return .with(
                    .backgroundColor(.white),
                    .cornerRadius(8),
                    .image(Images.Family.family_1.withRenderingMode(.alwaysOriginal))
                )
        default:
            return Style()
        }
    }

    func install(to label: UIButton) {
        style.install(to: label)
    }
}
