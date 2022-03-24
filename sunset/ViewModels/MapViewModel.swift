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
    
    private let locationProvider: LocationProvider
    
    override init() {
        locationProvider = LocationProvider()
        super.init()
        locationProvider.delegate = self
    }
    
    public func checkLocationAuthorization() {
        locationProvider.checkAuthorizationStatus()
    }
    
}

extension MapViewModel: LocationProviderDelegate {
    func didUpdateLocation(with lastLocation: CLLocationCoordinate2D) {
        self.region = MKCoordinateRegion(center: lastLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}
