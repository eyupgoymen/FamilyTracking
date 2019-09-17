//
//  AlertTypes.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 5.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

enum PopupType {
    case familyCreated(familyId: String)
    case memberIdCreated(memberId: String)
    case familyDetail(familyId: String, memberId: String, memberCount: Int)
    case showMemberDetail(memberId: String)
    case addMember
}
