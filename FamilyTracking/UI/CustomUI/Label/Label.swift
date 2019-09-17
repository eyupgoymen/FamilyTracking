//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

class Label: UILabel {
    private var style: LabelStyle = .none {
        didSet {
            style.install(to: self)
        }
    }

    convenience init(style: LabelStyle) {
        self.init(frame: .zero)
        defer {
            self.style = style
        }
    }

    func setProps(_ props: LabelProp...) {
        props.forEach { (prop) in
            prop.bind(to: self)
        }
    }
}
