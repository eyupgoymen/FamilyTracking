//
//  Loader.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import Lottie

class Loader: UIViewController {

    //Views
    var backgroundView     =   View(style: .alertBackground)
    var backgroundCover    =   View(style: .onlyWhite)
    var animationView      =   AnimationView()

    //Variables
    var loaderType: LoaderType = .map

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        playAnimation()
    }

    deinit {
        animationView.stop()
    }

    func playAnimation() {
        let animation = Animation.named(loaderType.rawValue)
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
    }
}
