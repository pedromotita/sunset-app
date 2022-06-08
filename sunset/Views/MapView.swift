//
//  MapView.swift
//  sunset
//
//  Created by Pedro Mota on 04/03/22.
//

import SwiftUI
import MapKit

struct MapView: View {

    @StateObject var locationProvider = LocationProvider()
    @State var showSunsetDetail = false
    @StateObject var mapViewModel = MapViewModel()
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $locationProvider.region,
                showsUserLocation: true,
                annotationItems: mapViewModel.sunsets
            ) { sunset in
                MapAnnotation(coordinate: sunset.location.coordinate) {
                    SunsetMapAnnotation()
                        .onTapGesture {
                            showSunsetDetail.toggle()
                            mapViewModel.selectedSunset = sunset
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
            locationProvider.checkAuthorizationStatus()
            mapViewModel.loadSunsets()
        }
        .sheetModal($showSunsetDetail) {
            SunsetDetailView(sunset: mapViewModel.selectedSunset ?? Sunset.empty)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
