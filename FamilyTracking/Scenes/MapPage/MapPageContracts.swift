//
//  MapPageContracts.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 10.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

protocol MapPageViewModelProtocol: class {
    var delegate: MapPageViewModelDelegate! { get set }
    var service: FamilyTrackService! { get set }
    var memberId: String!  { get set }
    var familyId: String!  { get set }
    var currentUserCoordinate: Coordinate? { get set }
    var members: [Member]? { get set }
    
    func notifyController(_ output: MapPageViewModelOutput)
    func updateLocation()
    func getFamily()
    func addMemberToFamily(memberId: String)
    func showUserDetail(at index: Int)
}

protocol MapPageViewModelDelegate: class {
    func handleViewModelOutPut(_ output: MapPageViewModelOutput)
}

enum MapPageViewModelOutput {
    case showUserDetail(userId: String)
    case showError(error: String)
    case showLoader(status: Bool)
    case familyFetched(members: [Member])
    case memberAdded
    case locationUpdated
}
