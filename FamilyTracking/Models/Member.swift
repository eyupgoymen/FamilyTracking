//
//  Member.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 10.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import FirebaseFirestore

struct Member {
    var id: String
    var familyId: String
    var lat: Double
    var long: Double
    
    init(snapShot: QueryDocumentSnapshot) {
        self.id         = snapShot["member_id"] as? String ?? ""
        self.familyId   = snapShot["family_id"] as? String ?? ""
        self.lat        = snapShot["lat"] as? Double ?? 0.00
        self.long       = snapShot["long"] as? Double ?? 0.00
    }
    
    init(id: String = "", familyId: String = "", lat: Double = 0.0, long: Double = 0.0) {
        self.id         = id
        self.familyId   = familyId
        self.lat        = lat
        self.long       = long
    }
}
