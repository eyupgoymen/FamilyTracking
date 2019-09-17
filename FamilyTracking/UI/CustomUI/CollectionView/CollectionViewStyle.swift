//
//  CollectionViewStyle.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

enum CollectionViewStyle {
    case none
    case mapBottom

    private var style: Style<CollectionViewProp> {
        switch self {
            case .mapBottom:
                return .with(
                    .scrollDirection(.horizontal),
                    .backgroundColor(UIColor.white.withAlphaComponent(0.3)),
                    .cornerRadius(12),
                    .edgeInsets(UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)),
                    .indicator(false, false)
                )
        default:
            return Style()
        }
    }

    func install(to collectionView: CollectionView) {
        style.install(to: collectionView)
    }
}
