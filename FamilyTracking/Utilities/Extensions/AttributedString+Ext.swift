//
//  AttributedString+Ext.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

extension NSAttributedString {
    static func alertTypedAttributedString(_ ordinaryText: String, _ redText: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(
                                string: ordinaryText,
                                attributes: [NSAttributedString.Key.font: Fonts.System_Placeholder])
        attributedString.append(NSAttributedString(
                                    string: redText,
                                    attributes: [NSAttributedString.Key.font: Fonts.System_Placeholder, NSAttributedString.Key.foregroundColor: Colors.alertRedColor]))
        return attributedString
    }
}
