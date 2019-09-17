//
//  Alertable.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

protocol Popupable {
    func showPopup(type: PopupType)
    func donePressed(type: PopupType)
    func addMemberPressed(memberId: String)
}

extension Popupable where Self: UIViewController {
    func showPopup(type: PopupType) {
        let popUpViewController = PopupViewController()
        popUpViewController.modalTransitionStyle = .crossDissolve
        popUpViewController.modalPresentationStyle = .overCurrentContext
        popUpViewController.type = type
        popUpViewController.delegate = self
        self.present(popUpViewController, animated: true, completion: nil)
    }
    
    //Make them optional
    func donePressed(type: PopupType) { }
    func addMemberPressed(memberId: String) { }
}
