//
//  HomePageViewModel.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 9.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

final class HomePageViewModel: HomePageViewModelProtocol {
    var service: FamilyTrackServiceProtocol!
    var memberId: String?
    var familyId: String?
    var delegate: HomePageViewModelDelegate!
    
    init(service: FamilyTrackService = FamilyTrackService()) {
        self.service = service
    }
    
    func getMemberId() {
        notifyController(.showLoader(status: true))
        let randomCoordinate = DummyDataService.coordinates[Int.random(in: 0 ..< DummyDataService.coordinates.count)]
        
        service.createMember(member: Member(id: String.randomString(length: 6), familyId: "", lat: randomCoordinate.lat, long: randomCoordinate.long), completion: { [weak self] (result) in
            guard let self = self else { return }
            self.notifyController(.showLoader(status: false))
            
            switch result{
                case .success(let memberId):
                    self.memberId = memberId
                    self.notifyController(.gotMemberId(id: memberId))
                
                case .failure(let error):
                    self.notifyController(.showError(error: error.localizedDescription))
            }
        })
    }
    
    func createFamily() {
        notifyController(.showLoader(status: true))
        
        service.createFamily(with: String.randomString(length: 6)) {[weak self](result) in
            guard let self = self else { return }
            
            switch result {
                case .success(let familyId):
                    self.familyId = familyId
                    
                    let randomCoordinate = DummyDataService.coordinates[Int.random(in: 0 ..< DummyDataService.coordinates.count)]
                    
                    self.service.createMember(member: Member(id: self.memberId ?? String.randomString(length: 6), familyId: familyId, lat: randomCoordinate.lat, long: randomCoordinate.long), completion: { [weak self] (result) in
                        guard let self = self else { return }
                        self.notifyController(.showLoader(status: false))
                        
                        switch result{
                            case .success(let userId):
                                self.memberId = userId
                                self.notifyController(.familyCreated(familyId: familyId))
                            
                            case .failure(let error):
                                self.notifyController(.showError(error: error.localizedDescription))
                        }
                    })
            case .failure(let error):
                self.notifyController(.showError(error: error.localizedDescription))
            }
        }
    }
    
    func joinFamily(familyId: String) {
        guard let userId = memberId else {
            notifyController(.showError(error: "Please get user id first."))
            return
        }

        notifyController(.showLoader(status: true))
        
        service.joinFamily(familyId: familyId, memberId: userId) {[weak self] (result) in
            guard let self = self else { return }
            self.notifyController(.showLoader(status: false))
            
            switch result {
                case .success(_):
                    self.familyId = familyId
                    self.notifyController(.joinedFamily)
                
                case .failure(let error):
                    self.notifyController(.showError(error: error.localizedDescription))
            }
        }
    }
    
    func navigateToMapPage() {
        guard let familyId = familyId, let memberId = memberId else {
            delegate.handleViewModelOutPut(.showError(error: "Get family and member id first"))
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.delegate.handleRoute(.routeToMapPage(familyId: familyId, memberId: memberId))
        })
    }
    
    
    func notifyController(_ output: HomePageViewModelOutput) {
        delegate.handleViewModelOutPut(output)
    }
}
