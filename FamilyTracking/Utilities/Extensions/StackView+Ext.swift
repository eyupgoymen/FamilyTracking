//
//  StackView+Ext.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

extension StackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
