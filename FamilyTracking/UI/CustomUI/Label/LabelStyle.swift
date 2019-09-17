//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

enum LabelStyle {
    case alert
    case bannerTitle
    case placeholder(title: String, color: UIColor)
    case none

    private var style: Style<LabelProp> {
        switch self {
            case .bannerTitle:
                return .with(
                    .color(.white),
                    .font(Fonts.Rockwell_Title),
                    .text("Family Track"),
                    .align(.center),
                    .numberOfLines(1)
                )
            case .placeholder(let title, let color):
                return .with(
                    .color(color),
                    .font(Fonts.System_Placeholder),
                    .align(.left),
                    .text(title)
                )
            case .alert:
                return .with(
                    .font(Fonts.System_Placeholder),
                    .color(Colors.lightGrayColor),
                    .align(.center),
                    .numberOfLines(2)
                )
            case .none:
                return .with()
        }
    }

    func install(to label: UILabel) {
        style.install(to: label)
    }
}
