//
//  LocationProvider.swift
//  sunset
//
//  Created by Pedro Mota on 07/03/22.
//

import Foundation
import CoreLocation
import MapKit

class LocationProvider: NSObject {
    
    private let locationManager: CLLocationManager
    private var mostRecentLocation: CLLocationCoordinate2D?
    private let defatulLocation = CLLocationCoordinate2D(latitude: -22.8045260, longitude: -47.0812497)
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
    
    public func getUserRegion() -> MKCoordinateRegion {
        
        locationManager.requestLocation()
        
        if let coordinate = self.locationManager.location?.coordinate {
            return MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        }
        
        return MKCoordinateRegion(center: self.defatulLocation, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))
        
    }
}

extension LocationProvider: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate {
            self.mostRecentLocation = coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}