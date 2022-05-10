//
//  LocationProvider.swift
//  sunset
//
//  Created by Pedro Mota on 07/03/22.
//

import Foundation
import CoreLocation
import MapKit

class LocationProvider: NSObject, ObservableObject {
    
    @Published public var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -22.813, longitude: -47.060), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    private let locationManager = CLLocationManager()
        
    override init() {
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
        self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
