//
//  GoogleMapView.swift
//  FamilyTracking
//
//  Created by Eyup Kazım Göymen on 6.09.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMaps

class GoogleMapView: UIView {
    var mapView: GMSMapView?
    private var markers = [GMSMarker]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setMap()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setMap() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.addSubview(mapView!)

        mapView!.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }

        setMapStyle()
    }

    func setUserMarker(memberId: String, lat: Double, long: Double) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        marker.title = "Member: \(memberId)"
        marker.map = mapView
        marker.icon = Images.Icon.map_pin
        markers.append(marker)
        
        //Center camera on the maker
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 8.0)
        self.mapView!.animate(to: camera)
    }
    
    func focusOnMarker(at index: Int) {
        let marker = markers[index]
        let camera = GMSCameraPosition.camera(withLatitude: marker.position.latitude, longitude: marker.position.longitude, zoom: 8.0)
        self.mapView!.animate(to: camera)
    }
    
    func resetMarkers() {
        guard let mapView = mapView else { return }
        markers.removeAll()
        mapView.clear()
    }

    private func setMapStyle() {
        if let styleURL = Bundle.main.url(forResource: "maps", withExtension: "json") {
            mapView!.mapStyle = try! GMSMapStyle(contentsOfFileURL: styleURL)
        }
    }
}
