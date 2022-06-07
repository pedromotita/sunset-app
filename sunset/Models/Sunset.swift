//
//  Sunset.swift
//  sunset
//
//  Created by Pedro Mota on 08/03/22.
//

struct Sunset: Identifiable, Codable {
    let id: Int
    let location: Coordinate
    let title: String
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}
