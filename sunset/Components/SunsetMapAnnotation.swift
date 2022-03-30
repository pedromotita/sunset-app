//
//  SunsetMapAnnotation.swift
//  sunset
//
//  Created by Pedro Mota on 30/03/22.
//

import SwiftUI

struct SunsetMapAnnotation: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
    }
}

struct SunsetMapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        SunsetMapAnnotation()
    }
}
