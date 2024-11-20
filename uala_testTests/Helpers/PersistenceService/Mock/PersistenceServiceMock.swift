//
//  PersistenceServiceMock.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

@testable import uala_test

final class PersistenceServiceMock {
    static var error: Error?
    static var response: [CityDataObject]?
}

extension PersistenceServiceMock: PersistenceServiceType {
    func fetchCities() throws -> [CityDataObject] {
        var respObject: [CityDataObject] = []
        
        if let response = PersistenceServiceMock.response {
            respObject = response
        }
        if let error = PersistenceServiceMock.error {
            throw error
        }
        return respObject
    }
    
    func addCity(_ city: CityDataObject) throws {
        if let error = PersistenceServiceMock.error {
            throw error
        }
    }
    
    func deleteCity(city: CityDataObject) throws {
        if let error = PersistenceServiceMock.error {
            throw error
        }
    }
    
    func save() throws {
        if let error = PersistenceServiceMock.error {
            throw error
        }
    }

}
