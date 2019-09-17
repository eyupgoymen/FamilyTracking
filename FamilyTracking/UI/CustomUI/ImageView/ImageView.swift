//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    var style: ImageViewStyle = .none {
        didSet {
            style.install(to: self)
        }
    }

    convenience init(style: ImageViewStyle) {
        self.init(frame: .zero)
        defer {
            self.style = style
        }
    }

    func set(props: ImageViewProp...) {
        props.forEach { $0.bind(to: self) }
    }
}
