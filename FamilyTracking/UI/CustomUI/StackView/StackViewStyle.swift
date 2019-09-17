//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

enum StackViewStyle {
    case defaultHorizantal
    case defaultVertical
    case none
    case exploreVertical

    private var style: Style<StackViewProp> {
        switch self {
        case .defaultHorizantal:
            return .with(
                .alignment(.fill),
                .axis(.horizontal),
                .distribution(.fillEqually),
                .spacing(8)
            )

        case .defaultVertical:
            return .with(
                .axis(.vertical),
                .alignment(.fill),
                .distribution(.equalSpacing),
                .spacing(4)
            )
        case .exploreVertical:
            return .with(
                .axis(.vertical),
                .alignment(.fill),
                .distribution(.fillEqually),
                .spacing(12)
            )
        default:
            return Style()
        }
    }

    func install(to view: UIStackView) {
        style.install(to: view)
    }

}
