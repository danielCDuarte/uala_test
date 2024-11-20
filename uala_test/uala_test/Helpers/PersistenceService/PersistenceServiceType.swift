//
//  PersistenceServiceType.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

protocol PersistenceServiceType {
    func fetchCities() throws -> [CityDataObject]
    func addCity(_ city : CityDataObject) throws
    func deleteCity(city: CityDataObject)  throws
    func save() throws
}
