//
//  View+Ext.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

extension UIView {
    func add(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
