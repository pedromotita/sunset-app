//
//  MapViewModel.swift
//  sunset
//
//  Created by Pedro Mota on 07/06/22.
//

import Foundation

class MapViewModel: ObservableObject {
    
    @Published var sunsets: [Sunset] = []
    
    private let jsonReader = JSONReaderService()
    
    func loadSunsets() {
        jsonReader.fetchFromLocalFile { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let sunsets): self.sunsets = sunsets
                case .failure(_): self.sunsets = []
            }
        }
    }
    
}
