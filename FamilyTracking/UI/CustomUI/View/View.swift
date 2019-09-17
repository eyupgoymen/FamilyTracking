//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

protocol ViewProducer {
    var size: CGSize { get }
    var view: UIView { get }
}

class View: UIView {
    private var style: ViewStyle = .none {
        didSet {
            style.install(to: self)
        }
    }
    convenience init(style: ViewStyle) {
        self.init(frame: .zero)
        defer {
            self.style = style
        }
    }

    func set(props: ViewStyle...) {
        props.forEach { (prop) in
            prop.install(to: self)
        }
    }
}
