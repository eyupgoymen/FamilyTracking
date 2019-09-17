//
//  ServiceError.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 15.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case memberCouldntFound
    case familyCouldntFound
}

extension ServiceError: LocalizedError{
    public var errorDescription: String? {
        switch self {
            case .memberCouldntFound:
                return NSLocalizedString("Couldnt found the member", comment: "Error")
            
            case .familyCouldntFound:
                return NSLocalizedString("Couldnt found the family", comment: "Error")
        }
    } 
}
