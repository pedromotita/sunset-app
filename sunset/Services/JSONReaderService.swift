//
//  JSONReaderService.swift
//  sunset
//
//  Created by Pedro Mota on 07/06/22.
//

import Foundation

enum JSONReaderError: Error {
    case JSONNotFound
    case UnkownError
}

class JSONReaderService {
    
    private let jsonFile = "sunsetData"
    
    func fetchFromLocalFile(completion: (Result<[Sunset], JSONReaderError>)->Void) {
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
