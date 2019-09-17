//
//  CollectionViewProp.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

enum CollectionViewProp: StylingProp {
    typealias T = UICollectionView
    case backgroundColor(_ color: UIColor)
    case cornerRadius(_ radius: CGFloat)
    case edgeInsets(_ edgeInsets: UIEdgeInsets)
    case scrollDirection(_ direction: UICollectionView.ScrollDirection)
    case indicator(_ showVertical: Bool, _ showHorizantal: Bool)
    case alpha(_ ratio: CGFloat)

    func bind(to collectionView: UICollectionView) {
        switch self {
            case .backgroundColor(let color):
                collectionView.backgroundColor = color
            case .cornerRadius(let radius):
                collectionView.layer.cornerRadius = radius
            case .edgeInsets(let insets):
                let flowLayout = collectionView.getLayout()
                flowLayout.sectionInset = insets
            case .scrollDirection(let direction):
                let flowLayout = collectionView.getLayout()
                flowLayout.scrollDirection = direction
            case .indicator(let showVertical, let showHorizantal):
                collectionView.showsVerticalScrollIndicator = showVertical
                collectionView.showsHorizontalScrollIndicator = showHorizantal
            case .alpha(let ratio):
                collectionView.alpha = ratio
        }
    }
}

extension UICollectionView {
    func setProps(_ props: CollectionViewProp...) {
        props.forEach { $0.bind(to: self) }
    }
}
