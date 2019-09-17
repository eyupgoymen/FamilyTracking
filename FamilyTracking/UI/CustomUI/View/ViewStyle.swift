//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

enum ViewStyle {
    case alertBackground
    case darkTransparent
    case onlyWhite
    case rounded(radius: CGFloat)
    case none

    private var style: Style<ViewProp> {
        switch self {
            case .darkTransparent:
                return .with(
                    .backgroundColor(.black),
                    .cornerRadius(12),
                    .alpha(0.12)
                )
            case .alertBackground:
                return .with(
                    .backgroundColor(.black),
                    .alpha(0.3)
                )
            case .onlyWhite:
                return .with(
                    .backgroundColor(.white),
                    .cornerRadius(8)
                )
            case .rounded(let radius):
                return .with(
                    .cornerRadius(radius),
                    .backgroundColor(.white),
                    .maskedCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner])
                )
            default:
                return Style()
        }
    }

    func install(to view: UIView) {
        style.install(to: view)
    }
}
