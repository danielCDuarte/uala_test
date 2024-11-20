//
//  PersistenceService.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import SwiftData
import Foundation
import SwiftUICore
import Resolver

class PersistenceService: PersistenceServiceType {
    
    let context: ModelContext

    init(container: ModelContainer) {
        context = ModelContext(container)
    }

    func fetchCities() throws -> [CityDataObject] {
        let descriptor = FetchDescriptor<CityDataObject>(sortBy: [SortDescriptor(\.name)])
        return try context.fetch(descriptor)
    }
    
    func addCity(_ city: CityDataObject) throws {
        context.insert(city)
    }

    func deleteCity(city: CityDataObject) throws {
        context.delete(city)
    }
    
    func save() throws {
        try context.save()
    }
}
