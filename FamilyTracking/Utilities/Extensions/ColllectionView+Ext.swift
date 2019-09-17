//
//  ColllectionView+Ext.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

extension UICollectionView {
    func getLayout() -> UICollectionViewFlowLayout {
        return self.collectionViewLayout as! UICollectionViewFlowLayout
    }
}

extension UICollectionViewCell {
    static var id: String {
        return String(describing: self)
    }
}
