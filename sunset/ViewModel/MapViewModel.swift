//
//  MapViewModel.swift
//  sunset
//
//  Created by Pedro Mota on 07/06/22.
//

import Foundation

class MapViewModel: ObservableObject {
    
    @Published var sunsets: [Sunset] = []
    @Published var selectedSunset: Sunset?
    
    private let sunsetProvider: SunsetProvider
    
    init() {
        self.sunsetProvider = JSONReaderService()
    }
    
    func loadSunsets() {
        sunsetProvider.fetchSunsets { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let sunsets): self.sunsets = sunsets
                case .failure(_): self.sunsets = []
            }
        }
    }
}
