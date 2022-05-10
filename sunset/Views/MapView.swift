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
    
    private var sunsets = [
        Sunset(
            id: UUID(),
            location: CLLocationCoordinate2D(latitude: -22.8318632, longitude: -47.0605383),
            title: "Por do Sol na Unicamp"
        )
    ]
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $locationProvider.region,
                showsUserLocation: true,
                annotationItems: sunsets
            ) { sunset in
                MapAnnotation(coordinate: sunset.location) {
                    SunsetMapAnnotation()
                        .onTapGesture {
                            showSunsetDetail.toggle()
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
        }
        .sheetModal(showSheet: $showSunsetDetail) {
            SunsetDetailView(sunset: sunsets[0])
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
