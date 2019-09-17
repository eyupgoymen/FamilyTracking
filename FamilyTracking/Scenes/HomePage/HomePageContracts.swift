//
//  HomePageContracts.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 8.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

protocol HomePageViewModelProtocol: class {
    var delegate: HomePageViewModelDelegate! { get set }
    var memberId: String? { get set }
    var familyId: String? { get set }
    var service: FamilyTrackServiceProtocol! { get set }
    
    func notifyController(_ output: HomePageViewModelOutput)
    func getMemberId()
    func createFamily()
    func joinFamily(familyId: String)
    
    func navigateToMapPage()
}

protocol HomePageViewModelDelegate: class {
    func handleViewModelOutPut(_ output: HomePageViewModelOutput)
    func handleRoute(_ route: HomePageRoute)
}

enum HomePageViewModelOutput {
    case showError(error: String)
    case showLoader(status: Bool)
    case familyCreated(familyId: String)
    case joinedFamily
    case gotMemberId(id: String)
}

enum HomePageRoute {
    case routeToMapPage(familyId: String, memberId: String)
}
