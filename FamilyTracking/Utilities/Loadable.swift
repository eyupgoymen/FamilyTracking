//
//  Loadable.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit

protocol Loadable {
    func showLoader(type: LoaderType)
    func dismissLoader()
}

extension Loadable where Self: UIViewController {
    func showLoader(type: LoaderType) {
        let loaderViewController = Loader()
        loaderViewController.modalTransitionStyle = .crossDissolve
        loaderViewController.modalPresentationStyle = .overCurrentContext
        loaderViewController.loaderType = type
        self.present(loaderViewController, animated: false, completion: nil)
    }

    func dismissLoader() {
        dismiss(animated: true, completion: nil)
    }
}
