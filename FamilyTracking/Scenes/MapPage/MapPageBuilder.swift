//
//  MapPageBuilder.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 10.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation
import UIKit

final class MapPageBuilder {
    static func make(familyId: String, memberId: String) -> MapPageViewController {
        let viewController = MapPageViewController()
        viewController.viewModel =  MapPageViewModel(memberId: memberId, familyId: familyId)
        return viewController
    }
}

