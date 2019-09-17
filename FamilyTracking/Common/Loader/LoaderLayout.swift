//
//  LoaderLayout.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SnapKit

extension Loader {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    ///Set navigation bar etc.
    func setLayout() {
        setSubViews()
        setConstraints()
    }

    ///Add subviews
    private func setSubViews() {
        view.add(backgroundView, backgroundCover, animationView)
    }

    ///Set constraint for subviews
    private func setConstraints() {
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        backgroundCover.snp.makeConstraints { (make) in
            make.width.height.equalTo(90)
            make.centerX.centerY.equalToSuperview()
        }

        animationView.snp.makeConstraints { (make) in
            make.width.height.equalTo(90)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
