//
//  MapView.swift
//  sunset
//
//  Created by Pedro Mota on 04/03/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var mapViewModel = MapViewModel()
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapViewModel.region)
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
