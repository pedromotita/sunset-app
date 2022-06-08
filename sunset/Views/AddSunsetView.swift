//
//  AddSunsetView.swift
//  sunset
//
//  Created by Pedro Mota on 08/06/22.
//

import SwiftUI

struct AddSunsetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var sunset: Sunset = Sunset.empty
    
    private let title = "Add sunset"
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Title", text: $sunset.title)
                    } header: {
                        Text("Sunset details")
                    }
                    Button(action: {}) {
                        Label("Add photos", systemImage: "folder.badge.plus")
                            .foregroundColor(.red)
                    }
                }
                LargeButton(title: "Add sunset", action: {})
            }
            .background(Color(uiColor: UIColor.systemGroupedBackground))
            .navigationTitle(self.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .tint(.red)
    }
}

struct AddSunsetView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Add sunset view")
            .sheet(isPresented: .constant(true)) {
                AddSunsetView()
            }
    }
}
