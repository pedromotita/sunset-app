//
//  MapView.swift
//  sunset
//
//  Created by Pedro Mota on 04/03/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var mapViewModel = MapViewModel()
    
    private var sunsets = [Sunset(location: CLLocationCoordinate2D(latitude: -22.8318632, longitude: -47.0605383))]
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $mapViewModel.region,
                showsUserLocation: true,
                annotationItems: sunsets
            ) { sunset in
                MapAnnotation(coordinate: sunset.location) {
                    SunsetMapAnnotation()
                        .onTapGesture {
                            print("Implement SunsetMapAnnotation tap gesture")
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
        .accentColor(.red)
        .onAppear {
            mapViewModel.checkLocationAuthorization()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
