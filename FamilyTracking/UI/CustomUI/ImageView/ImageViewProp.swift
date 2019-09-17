//
//  HomePageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

enum ImageViewProp: StylingProp {
    typealias T = UIImageView
    case cornerRadius(_ : CGFloat)
    case clipsToBounds(_: Bool)
    case contentMode(_ : UIView.ContentMode)
    case image(_ : UIImage)

    func bind(to imageView: UIImageView) {
        switch self {
            case .cornerRadius(let radius):
                imageView.layer.cornerRadius = radius
            case .clipsToBounds(let bound):
                imageView.clipsToBounds = bound
            case .contentMode(let contentMode):
                imageView.contentMode = contentMode
            case .image(let img):
                imageView.image = img
        }
    }
}
