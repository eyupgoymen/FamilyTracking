//
//  HomePageBuilder.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 9.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

final class HomePageBuilder {
    static func make() -> UINavigationController {
        let viewController = HomePageViewController()
        viewController.viewModel =  HomePageViewModel()
        return UINavigationController(rootViewController: viewController)
    }
}
