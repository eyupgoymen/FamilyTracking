//
//  BaseViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 5.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    //Dismiss keyboard, when touched any place
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
