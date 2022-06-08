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
    @State var showAddSunsetSheet = false
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
                AddButton {
                    showAddSunsetSheet.toggle()
                }
            }
        }
        .accentColor(.red)
        .sheet(isPresented: $showAddSunsetSheet) {
            AddSunsetView()
        }
        .sheetModal($showSunsetDetail) {
            SunsetDetailView(sunset: mapViewModel.selectedSunset ?? Sunset.empty)
        }
        .onAppear {
            locationProvider.checkAuthorizationStatus()
            mapViewModel.loadSunsets()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
