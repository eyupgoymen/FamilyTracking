//
//  TextField.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

class TextField: UITextField {
    var style: TextFieldStyle = .none {
        didSet {
            style.install(to: self)
        }
    }

    convenience init(style: TextFieldStyle) {
        self.init(frame: .zero)
        defer {
            self.style = style
        }
    }

    func set(props: TextFieldProp...) {
        props.forEach { $0.bind(to: self) }
    }
}
