//
//  CollectionView.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

class CollectionView: UICollectionView {
    var style: CollectionViewStyle = .none {
        didSet {
            style.install(to: self)
        }
    }

    convenience init(style: CollectionViewStyle) {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        defer {
            self.style = style
        }
    }

    func set(props: CollectionViewProp...) {
        props.forEach { $0.bind(to: self) }
    }
}
