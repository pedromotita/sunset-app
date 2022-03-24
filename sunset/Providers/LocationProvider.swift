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
    
    public var delegate: LocationProviderDelegate?
        
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
    
    private func requestUserLocation() {
        self.locationManager.requestLocation()
    }
    
    public func checkAuthorizationStatus() {
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("location restricted")
            case .denied:
                print("location denied")
            case .authorizedAlways:
                print("authorized a")
            case .authorizedWhenInUse:
                self.requestUserLocation()
            @unknown default:
                break
        }
    }
}

extension LocationProvider: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.checkAuthorizationStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        if let delegate = self.delegate {
            delegate.didUpdateLocation(with: location.coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

protocol LocationProviderDelegate: AnyObject {
    
    func didUpdateLocation(with lastLocation: CLLocationCoordinate2D)
    
}
