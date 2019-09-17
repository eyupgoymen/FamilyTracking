//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

final class Style<V: StylingProp> {
    var props = [V]()

    static func with(_ props: V...) -> Style<V> {
        let style = Style<V>()
        style.props = props
        return style
    }

    func install(to view: V.T) {
        props.forEach { (prop) in
            prop.bind(to: view)
        }
    }
}
