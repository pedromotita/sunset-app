//
//  MapViewModel.swift
//  sunset
//
//  Created by Pedro Mota on 07/03/22.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    
    @Published var region: MKCoordinateRegion
    
    private let locationProvider = LocationProvider()
    
    init() {
        self.region = locationProvider.getUserRegion()
    }
    
}
