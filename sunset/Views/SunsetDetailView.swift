//
//  SunsetDetailView.swift
//  sunset
//
//  Created by Pedro Mota on 10/05/22.
//

import SwiftUI
import MapKit

struct SunsetDetailView: View {
    
    public var sunset: Sunset
    
    var body: some View {
        VStack {
            HStack {
                Text(sunset.title)
                    .font(.headline)
                Spacer()
                Text("137")
                Image(systemName: "heart")
            }
            Divider()
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Image("sunsetImage1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Image("sunsetImage2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SunsetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .sheetModal(showSheet: .constant(true)) {
                SunsetDetailView(
                    sunset: Sunset(
                        id: 0,
                        location: Coordinate(latitude: -22.8318632, longitude: -47.0605383),
                        title: "Por do Sol na Unicamp"
                    )
                )
            }
    }
}
