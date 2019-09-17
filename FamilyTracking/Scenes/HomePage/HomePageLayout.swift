//
//  HomePageLayout.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SnapKit

extension HomePageViewController {

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
        view.add(backgroundImageView, titleLabel)
        view.add(blackTransperentView)
        view.add(familyTextField)
        view.add(createFamilyButton, getMemberIdButton, joinButton, orLabel)
    }

    ///Set constraint for subviews
    private func setConstraints() {
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY).offset(-120)
        }

        blackTransperentView.snp.makeConstraints { (make) in
            make.left.equalTo(32)
            make.right.equalTo(-32)
            make.height.equalTo(280)
            make.top.equalTo(view.snp.centerY).offset(-36)
        }

        familyTextField.snp.makeConstraints { (make) in
            make.left.equalTo(blackTransperentView.snp.left).offset(32)
            make.right.equalTo(blackTransperentView.snp.right).offset(-32)
            make.top.equalTo(blackTransperentView.snp.top).offset(32)
            make.height.equalTo(44)
        }

        //Bottom side, buttons
        joinButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalTo(familyTextField.snp.bottom).offset(36)
            make.left.equalTo(familyTextField.snp.left).offset(36)
        }

        orLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(joinButton.snp.bottom).offset(12)
        }

        createFamilyButton.snp.makeConstraints { (make) in
            make.height.equalTo(48)
            make.top.equalTo(orLabel.snp.bottom).offset(12)
            make.right.equalTo(view.snp.centerX).offset(-12)
            make.width.equalTo(joinButton.snp.width).offset(-64)
        }

        getMemberIdButton.snp.makeConstraints { (make) in
            make.height.equalTo(48)
            make.top.equalTo(orLabel.snp.bottom).offset(12)
            make.left.equalTo(view.snp.centerX).offset(12)
            make.width.equalTo(joinButton.snp.width).offset(-64)
        }
    }
}
