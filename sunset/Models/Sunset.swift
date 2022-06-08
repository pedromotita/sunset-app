//
//  Sunset.swift
//  sunset
//
//  Created by Pedro Mota on 08/03/22.
//

import CoreLocation

struct Sunset: Identifiable, Codable {
    let id: Int
    let location: Coordinate
    let title: String
}

extension Sunset {
    static var empty: Sunset {
        return Sunset(id: 0, location: Coordinate(latitude: 0.0, longitude: 0.0), title: "")
    }
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

extension Coordinate {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
