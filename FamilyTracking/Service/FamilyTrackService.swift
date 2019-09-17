//
//  FamilyTrackService.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 8.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import FirebaseFirestore

//Return family id
typealias StringClosure   =  (Result<String, Error>) -> Void
typealias BoolClosure     =  (Result<Bool, Error>) -> Void
typealias IntClosure      =  (Result<Int, Error>) -> Void
typealias MemberClosure   =  (Result<[Member], Error>) -> Void

protocol FamilyTrackServiceProtocol {
    func createFamily(with id: String, completion: @escaping StringClosure)
    func createMember(member: Member, completion: @escaping StringClosure)
    func joinFamily(familyId: String, memberId: String, completion: @escaping BoolClosure)
    func getFamilyMembers(familyId: String, completion: @escaping MemberClosure)
}

class FamilyTrackService: FamilyTrackServiceProtocol {
   
    private let firestore = Firestore.firestore()
    private lazy var familyCollection = firestore.collection("Family")
    private lazy var memberCollection = firestore.collection("Member")
    
    func createFamily(with id: String, completion: @escaping StringClosure) {
        familyCollection.document(id).setData([
            "family_id" : id,
            "member_count" : 0
        ]) { (error) in
            print(Thread.isMainThread)
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(id))
        }
    }
    
    func createMember(member: Member, completion: @escaping StringClosure) {
       memberCollection.document(member.id).setData([
            "family_id" : member.familyId,
            "member_id" : member.id,
            "lat": member.lat,
            "long": member.long
        ]) { (error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(member.id))
        }
    }
    
    func joinFamily(familyId: String, memberId: String, completion: @escaping BoolClosure) {
        //First check if member exists
        memberCollection.whereField("member_id", isEqualTo: memberId).getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard snapshot?.documents.first != nil else {
                completion(.failure(ServiceError.memberCouldntFound))
                return
            }
            
            //Check if family exists
            self.familyCollection.whereField("family_id", isEqualTo: familyId).getDocuments { (snapshot, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let family = snapshot?.documents.first else {
                    completion(.failure(ServiceError.familyCouldntFound))
                    return
                }
                
                self.memberCollection.document(memberId).updateData([
                    "family_id" : family.data()["family_id"] as? String ?? "",
                    "member_id" : memberId,
                ]) { (error) in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    completion(.success(true))
                    return
                }
            }
        }
    }
    
    func getFamilyMembers(familyId: String, completion: @escaping MemberClosure) {
        var members = [Member]()
        
        memberCollection.getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            snapshot?.documents.forEach {
                if ($0.data()["family_id"] as? String == familyId) {
                    members.append(Member(snapShot: $0))
                }
            }
            
            completion(.success(members))
        }
    }
    
    func updateLocation(member: Member, completion: @escaping BoolClosure) {
        memberCollection.document(member.id).setData([
            "lat": member.lat,
            "long": member.long
        ]) { (error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(true))
        }
    }
}
