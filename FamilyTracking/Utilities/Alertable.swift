//
//  Alertable.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 9.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

protocol Alertable {
    func showAlert(title: String, message: String)
}

extension Alertable where Self: UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
