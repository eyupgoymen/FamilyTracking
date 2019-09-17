//
//  PopupViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 5.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

final class PopupViewController: UIViewController {

    //Variables
    var popupHeight          = 180
    var delegate: Popupable?

    var type: PopupType? {
        didSet {
            guard let type = type else { return }
            switch type {
                case .familyCreated(let familyId):
                    popupHeight = 160
                    iconImageView.set(props: .image(Images.Family.family_1))
                    topLabel.setProps(.text("Your family has been created successfully."))
                    midLabel.setProps(.attributedText(NSAttributedString.alertTypedAttributedString("Family Id: ", "\(familyId)")))
                
                case .memberIdCreated(let memberId):
                    popupHeight = 160
                    iconImageView.set(props: .image(Images.Family.family_1))
                    topLabel.setProps(.text("Account has been created successfully."))
                    midLabel.setProps(.attributedText(NSAttributedString.alertTypedAttributedString("Member Id: ", "\(memberId)")))
                
                case .showMemberDetail(let memberId):
                    popupHeight = 160
                    iconImageView.set(props: .image(Images.Family.family_1))
                    topLabel.setProps(.text("Family Detail"))
                    midLabel.setProps(.attributedText(NSAttributedString.alertTypedAttributedString("Member Id: ", "\(memberId)")))

                case .familyDetail(let familyId, let memberId, let memberCount):
                    popupHeight = 180
                    iconImageView.set(props: .image(Images.Family.family_2))
                    topLabel.setProps(.attributedText(NSAttributedString.alertTypedAttributedString("Family Id: ", "\(familyId)")))
                    midLabel.setProps(.attributedText(NSAttributedString.alertTypedAttributedString("Your Id: ", "\(memberId)")))
                    bottomLabel.setProps(.attributedText(NSAttributedString.alertTypedAttributedString("Member Count: ", "\(memberCount)")))

                case .addMember:
                    popupHeight = 160
                    iconImageView.set(props: .image(Images.Icon.popup_email))
                
            }
        }
    }

    //Views
    var backgroundView     =   View(style: .alertBackground)
    var backgroundCover    =   View(style: .onlyWhite)
    var backgroundRounded  =   View(style: .rounded(radius: 60))
    let topLabel           =   Label(style: .alert)
    let midLabel           =   Label(style: .alert)
    let bottomLabel        =   Label(style: .alert)
    lazy var iconImageView =   ImageView(style: .aspectFit)
    let verticalStackView  =   StackView(style: .defaultVertical)
    let okButton           =   Button(style: .dark(title: "OK"))
    let sendButton         =   Button(style: .dark(title: "Add"))
    let memberIdTextField  =   TextField(style: .popup("Member Id"))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRecognizers()
        setLayout()
        setTargets()
    }

    private func setRecognizers() {
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }

    private func setTargets() {
        okButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(handleMemberAdd), for: .touchUpInside)
    }
}

///Handle actions
extension PopupViewController {
    @objc func handleDismiss() {
        dismiss(animated: true) {
             self.delegate?.donePressed(type: self.type!)
        }
    }
    
    @objc func handleMemberAdd() {
        dismiss(animated: true) {
            self.delegate?.addMemberPressed(memberId: self.memberIdTextField.text ?? "")
        }
    }
}
