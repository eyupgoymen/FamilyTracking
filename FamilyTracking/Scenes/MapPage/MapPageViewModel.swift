//
//  MapPageViewModel.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 10.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

final class MapPageViewModel: MapPageViewModelProtocol {
    var delegate: MapPageViewModelDelegate!
    var service: FamilyTrackService!
    var memberId: String!
    var familyId: String!
    var members: [Member]?
    var currentUserCoordinate: Coordinate?
    
    init(service: FamilyTrackService = FamilyTrackService(),
         memberId: String!,
         familyId: String!) {
        self.service     = service
        self.familyId    = familyId
        self.memberId    = memberId
    }
    
    func updateLocation() {
        guard let coordinate = currentUserCoordinate else { return }
        service.updateLocation(member: Member(id: memberId, familyId: familyId, lat: coordinate.lat, long: coordinate.long)) {[weak self](result) in
            guard let self = self else { return }
            
            switch result {
                case .success(_):
                    self.notifyController(.locationUpdated)
                
                case .failure(let error):
                    self.notifyController(.showError(error: error.localizedDescription))
            }
        }
    }
    
    func getFamily() {
        service.getFamilyMembers(familyId: familyId) {[weak self](result) in
            guard let self = self else { return }
      
            switch result {
                case .success(let members):
                    self.members = members
                    self.notifyController(.familyFetched(members: members))
                
                case .failure(let error):
                    self.notifyController(.showError(error: error.localizedDescription))
            }
        }
    }
    
    ///Add member to family and fetch all family once again
    func addMemberToFamily(memberId: String) {
        self.notifyController(.showLoader(status: true))
        
        service.joinFamily(familyId: familyId, memberId: memberId) {[weak self](result) in
            guard let self = self else { return }
            
            switch result {
                case .success(_):
                    self.service.getFamilyMembers(familyId: self.familyId) {[weak self](result) in
                        guard let self = self else { return }
                        self.notifyController(.showLoader(status: false))
                        
                        switch result {
                            case .success(let members):
                                self.members = members
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                    self.notifyController(.familyFetched(members: members))
                                    self.notifyController(.memberAdded)
                                })

                            case .failure(let error):
                                self.notifyController(.showError(error: error.localizedDescription))
                            }
                    }
                    
                    self.notifyController(.memberAdded)
                
                case .failure(let error):
                    self.notifyController(.showError(error: error.localizedDescription))
            }
        }
    }
    
    func showUserDetail(at index: Int) {
        notifyController(.showUserDetail(userId: members?[index].id ?? "Not Found"))
    }
    
    func notifyController(_ output: MapPageViewModelOutput) {
        delegate.handleViewModelOutPut(output)
    }
}
