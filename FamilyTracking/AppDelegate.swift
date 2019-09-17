//
//  AppDelegate.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 4.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        //setup google maps
        GMSPlacesClient.provideAPIKey(googleMapsAPIKey)
        GMSServices.provideAPIKey(googleMapsAPIKey)

        FirebaseApp.configure()

        window?.rootViewController = HomePageBuilder.make()
        window?.makeKeyAndVisible()
        return true
    }
}
