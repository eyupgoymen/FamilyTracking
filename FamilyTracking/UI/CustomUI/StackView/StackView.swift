//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

class StackView: UIStackView {
    private var style: StackViewStyle = .none {
        didSet {
            style.install(to: self)
        }
    }

    convenience init(style: StackViewStyle) {
        self.init(frame: .zero)
        defer {
            self.style = style
        }
    }

    func set(props: StackViewStyle...) {
        props.forEach { (prop) in
            prop.install(to: self)
        }
    }
}
