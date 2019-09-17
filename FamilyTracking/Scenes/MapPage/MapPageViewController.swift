//
//  MapPageViewController.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation

class MapPageViewController: UIViewController, Loadable, Alertable {
    
    //Variables
    var memberId: String!
    var familyId: String!
    var members = [Member]()
    let locationManager = CLLocationManager()
    var timer: Timer!
    var viewModel: MapPageViewModelProtocol! {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.delegate = self
        }
    }
    
    //Views
    let googleMap               = GoogleMapView()
    let familyInfoButton        = Button(style: .familyInfo)
    let familyCollectionView    = CollectionView(style: .mapBottom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setRegisters()
        setTargets()
        setLocationManager()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(updateService), userInfo: nil, repeats: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.getFamily()
        }
    }
    
    deinit {
        timer.invalidate()
    }
    
    @objc private func updateService() {
        viewModel.getFamily()
        viewModel.updateLocation()
    }

    private func setTargets() {
        familyInfoButton.addTarget(self, action: #selector(handleMapInfo), for: .touchUpInside)
    }
    
    private func setLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func setRegisters() {
        familyCollectionView.delegate = self
        familyCollectionView.dataSource = self
        familyCollectionView.register(FamilyCell.self, forCellWithReuseIdentifier: FamilyCell.id)
    }
}

extension MapPageViewController {
    @objc func handleMapInfo() {
        showPopup(type: .familyDetail(familyId: viewModel.familyId, memberId: viewModel.memberId, memberCount: members.count))
    }
}

extension MapPageViewController: CollectionViewProtocols {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FamilyCell.id, for: indexPath) as! FamilyCell
        cell.isAddCell = indexPath.row == 0 ? true : false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48, height: 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row != 0 else {
            showPopup(type: .addMember)
            return
        }
        googleMap.focusOnMarker(at: members.count - indexPath.row)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewModel.showUserDetail(at: indexPath.row - 1)
        }
    }
}

extension MapPageViewController: MapPageViewModelDelegate {
    func handleViewModelOutPut(_ output: MapPageViewModelOutput) {
        switch output {
            case .showUserDetail(let memberId):
                showPopup(type: .showMemberDetail(memberId: memberId))
                
            case .showLoader(let status):
                status == true ? showLoader(type: .map) : dismissLoader()
                
            case .showError(let error):
                showAlert(title: "Error", message: error.localizedLowercase)
                
            case .familyFetched(let members):
                self.members = members
                googleMap.resetMarkers()
                members.forEach { googleMap.setUserMarker(memberId: $0.id == viewModel.memberId ? "It's me" : $0.id, lat: $0.lat, long: $0.long)}
                familyCollectionView.reloadData()
                
            case .memberAdded:
                print("New member added")
                
            case .locationUpdated:
                print("Current user's location updated")
        }
    }
}

extension MapPageViewController: Popupable {
    func addMemberPressed(memberId: String) {
        viewModel.addMemberToFamily(memberId: memberId)
    }
}

extension MapPageViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        viewModel.currentUserCoordinate = Coordinate(lat: locValue.latitude, long: locValue.longitude)
    }
}
