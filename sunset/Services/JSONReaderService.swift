//
//  JSONReaderService.swift
//  sunset
//
//  Created by Pedro Mota on 07/06/22.
//

import Foundation

enum FetchSunsetError: Error {
    case JSONNotFound
    case UnkownError
}

protocol SunsetProvider {
    func fetchSunsets(completion: (Result<[Sunset], FetchSunsetError>) -> Void)
}

class JSONReaderService: SunsetProvider {
    
    private let jsonFile = "sunsetData"
    
    func fetchSunsets(completion: (Result<[Sunset], FetchSunsetError>)->Void) {
        if let fileUrl = Bundle.main.url(forResource: self.jsonFile, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                let decodedData = try JSONDecoder().decode([Sunset].self, from: data)
                completion(.success(decodedData))
            } catch {
                print(error)
                completion(.failure(.UnkownError))
            }
        } else {
            completion(.failure(.JSONNotFound))
        }
    }
}
