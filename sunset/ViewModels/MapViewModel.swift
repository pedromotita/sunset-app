//
//  MapViewModel.swift
//  sunset
//
//  Created by Pedro Mota on 07/03/22.
//

import Foundation
import Combine
import MapKit

class MapViewModel: NSObject, ObservableObject {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -22.813, longitude: -47.060), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
    }
    
    func requestAllowOnceLocationPermition() {
        if let locationManager = locationManager {
            locationManager.requestLocation()
        }
    }
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Location service not enabled")
        }
    }
    
    private func checkLocationAuthorization() {
        
        guard let locationManager = locationManager else { return }

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
                self.requestAllowOnceLocationPermition()
            @unknown default:
                break
        }
    }
    
}

extension MapViewModel: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let latestLocation = locations.first else { return }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
