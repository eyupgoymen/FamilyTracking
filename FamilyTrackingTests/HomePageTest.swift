//
//  HomePageTest.swift
//  FamilyTrackingTests
//
//  Created by Eyup Kazım Göymen on 13.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import XCTest
@testable import FamilyTracking

class HomePageTest: XCTestCase {
    var viewModel:   HomePageViewModel!
    var mockView:    MockHomeView!
    var mockService: MockService!
    
    override func setUp() {
        super.setUp()
        viewModel   = HomePageViewModel()
        mockView    = MockHomeView()
        mockService = MockService()
        viewModel.service = mockService
        viewModel.delegate = mockView
    }
    
    func testGetMemberId() throws {
        viewModel.getMemberId()
        
        XCTAssertEqual(mockView.isNavigatedToMapPage, false)
        XCTAssertEqual(mockView.outputs.count, 3)
        
        guard case .showLoader(status: true) = try mockView.outputs.element(at: 0) else {
            XCTFail("Expected .setLoading(true), got \(try mockView.outputs.element(at: 0))")
            return
        }
        
        guard case .showLoader(status: false) = try mockView.outputs.element(at: 1) else {
            XCTFail("Expected .setLoading(false), got \(try mockView.outputs.element(at: 1))")
            return
        }
        
        guard case .gotMemberId("dummy_member_id") = try mockView.outputs.element(at: 2) else {
            XCTFail("Expected .gotMemberId(dummy_member_id), got \(try mockView.outputs.element(at: 2))")
            return
        }
    }
    
    func testCreateFamily() throws {
        viewModel.createFamily()
        
        XCTAssertEqual(mockView.isNavigatedToMapPage, false)
        XCTAssertEqual(mockView.outputs.count, 3)
        
        guard case .showLoader(status: true) = try mockView.outputs.element(at: 0) else {
            XCTFail("Expected .setLoading(true), got \(try mockView.outputs.element(at: 0))")
            return
        }
        
        guard case .showLoader(status: false) = try mockView.outputs.element(at: 1) else {
            XCTFail("Expected .setLoading(false), got \(try mockView.outputs.element(at: 1))")
            return
        }
        
        guard case .familyCreated(familyId: "dummy_family_id") = try mockView.outputs.element(at: 2) else {
            XCTFail("Expected .familyCreated(dummy_family_id), got \(try mockView.outputs.element(at: 2))")
            return
        }
    }
    
    func testJoinFamily() throws {
        viewModel.getMemberId()
        viewModel.joinFamily(familyId: "dummy")
        
        XCTAssertEqual(mockView.isNavigatedToMapPage, false)
        XCTAssertEqual(mockView.outputs.count, 6)
        
        guard case .showLoader(status: true) = try mockView.outputs.element(at: 0) else {
            XCTFail("Expected .setLoading(true), got \(try mockView.outputs.element(at: 0))")
            return
        }
        
        guard case .showLoader(status: false) = try mockView.outputs.element(at: 1) else {
            XCTFail("Expected .setLoading(false), got \(try mockView.outputs.element(at: 1))")
            return
        }
        
        guard case .joinedFamily = try mockView.outputs.element(at: 5) else {
            XCTFail("Expected joinedFamily, got \(try mockView.outputs.element(at: 5))")
            return
        }
    }
}

class MockHomeView: HomePageViewModelDelegate {
    var outputs = [HomePageViewModelOutput]()
    var isNavigatedToMapPage = false
    
    func reset() {
        outputs.removeAll()
    }
    
    func handleViewModelOutPut(_ output: HomePageViewModelOutput) {
        outputs.append(output)
    }
    
    func handleRoute(_ route: HomePageRoute) {
        switch route {
        case .routeToMapPage(_):
            isNavigatedToMapPage = true
        }
    }
}

class MockService: FamilyTrackServiceProtocol {
    func createFamily(with id: String, completion: @escaping StringClosure) {
        completion(.success("dummy_family_id"))
    }
    
    func createMember(member: Member, completion: @escaping StringClosure) {
        completion(.success("dummy_member_id"))
    }
    
    func joinFamily(familyId: String, memberId: String, completion: @escaping BoolClosure) {
        completion(.success(true))
    }
    
    func getFamilyMembers(familyId: String, completion: @escaping MemberClosure) {
        completion(.success(
            [Member(id: "id1", familyId: "family_id1", lat: 0, long: 0),
             Member(id: "id2", familyId: "family_id2", lat: 1, long: 1)]
            ))
    }

}
