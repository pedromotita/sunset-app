//
//  Sunset.swift
//  sunset
//
//  Created by Pedro Mota on 08/03/22.
//

import Foundation
import CoreLocation

struct Sunset: Identifiable {
    
    let id: UUID
    let location: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), location: CLLocationCoordinate2D) {
        self.id = id
        self.location = location
    }
    
}
