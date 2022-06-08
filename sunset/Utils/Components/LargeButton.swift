//
//  LargeButton.swift
//  sunset
//
//  Created by Pedro Mota on 08/06/22.
//

import SwiftUI

struct LargeButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(.white)
                .frame(maxWidth: .greatestFiniteMagnitude)
                .padding()
                .background(Color.red)
                .cornerRadius(12)
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
        }
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton(title: "Add sunset", action: {})
    }
}
