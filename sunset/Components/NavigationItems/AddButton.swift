//
//  AddButton.swift
//  sunset
//
//  Created by Pedro Mota on 04/03/22.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        Button {
            print("Add button tapped")
        } label: {
            Label("Add button", systemImage: "plus")
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
