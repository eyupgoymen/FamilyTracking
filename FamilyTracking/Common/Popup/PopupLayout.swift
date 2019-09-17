//
//  PopupLayout.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 5.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SnapKit

extension PopupViewController {

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
        view.add(backgroundView)
        view.add(backgroundCover, backgroundRounded)
        view.add(iconImageView)

        //Add subviews depending on type
        guard let type = type else { return }
        switch type {
            case .familyCreated, .memberIdCreated(_), .showMemberDetail(_):
                verticalStackView.addArrangedSubviews(topLabel, midLabel)
                view.add(okButton, verticalStackView)

            case .familyDetail:
                verticalStackView.addArrangedSubviews(topLabel, midLabel, bottomLabel)
                view.add(okButton, verticalStackView)

            case .addMember:
                verticalStackView.addArrangedSubviews(memberIdTextField, sendButton)
                verticalStackView.spacing = 12
                view.add(verticalStackView)
        }
    }

    ///Set constraint for subviews
    private func setConstraints() {
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        backgroundCover.snp.makeConstraints { (make) in
            make.left.equalTo(36)
            make.right.equalTo(-36)
            make.centerY.equalToSuperview()
            make.height.equalTo(popupHeight)
        }

        backgroundRounded.snp.makeConstraints { (make) in
            make.width.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(backgroundCover.snp.top).offset(24)
        }

        iconImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.top.equalTo(backgroundRounded.snp.top).offset(18)
        }

        //If button has added to superview
        if self.view.subviews.contains(okButton) {
            okButton.snp.makeConstraints { (make) in
                make.width.equalTo(140)
                make.height.equalTo(48)
                make.centerX.equalToSuperview()
                make.bottom.equalTo(backgroundCover.snp.bottom).offset(-12)
            }
        }

        //If verticalStackView has added to superview
        if self.view.subviews.contains(verticalStackView) {
            verticalStackView.snp.makeConstraints { (make) in
                make.left.equalTo(backgroundCover.snp.left).offset(24)
                make.right.equalTo(backgroundCover.snp.right).offset(-24)
                make.top.equalTo(iconImageView.snp.bottom).offset(12)
            }
        }
        
        //If sendButton has added to verticalStackView
        if self.verticalStackView.subviews.contains(sendButton) {
            sendButton.snp.makeConstraints { (make) in
                make.height.equalTo(44)
            }
            
            memberIdTextField.snp.makeConstraints { (make) in
                make.height.equalTo(44)
            }
            
        }
    }
}
