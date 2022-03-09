//
//  MapView.swift
//  sunset
//
//  Created by Pedro Mota on 04/03/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -22.8045260, longitude: -47.0812497),
        span: MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8)
    )
    
    private var sunsets = [Sunset(location: CLLocationCoordinate2D(latitude: -22.8318632, longitude: -47.0605383))]
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $region,
                annotationItems: sunsets
            ) { sunset in
                MapAnnotation(coordinate: sunset.location) {
                    Circle()
                        .foregroundColor(.red)
                        .onTapGesture {
                            print("tapped")
                        }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Sunset")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                AddButton()
            }
        }
        .tint(.red)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
