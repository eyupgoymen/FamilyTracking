//
//  MapPageLayout.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SnapKit

extension MapPageViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    ///Set navigation bar etc.
    func setLayout() {
        setSubViews()
        setConstraints()
        definesPresentationContext = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    ///Add subviews
    private func setSubViews() {
        view.add(googleMap, familyInfoButton)
        view.add(familyCollectionView)
    }

    ///Set constraint for subviews
    private func setConstraints() {
        googleMap.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }

        familyInfoButton.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.width.height.equalTo(60)
        }

        familyCollectionView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-64)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(64)
        }
    }
}
