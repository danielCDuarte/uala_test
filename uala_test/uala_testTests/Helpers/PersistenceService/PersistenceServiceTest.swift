//
//  PersistenceServiceTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

@testable import uala_test
import XCTest
import SwiftData

class PersistenceServiceTest: XCTestCase {
    private var sut: PersistenceServiceType!
    var modelContainer: ModelContainer!
    
    override func setUpWithError() throws {
        modelContainer = {
            let schema = Schema([
                CityDataObject.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        
        sut = PersistenceService(container: modelContainer)
    }
    
    override func tearDownWithError() throws {
        modelContainer = nil
        sut = nil
    }
    
    func testPersistenceService_WhenAddCity_ThenShouldBeSuccess() throws {
        //Given
        let cityDataObject = TestDomainConstants.cityDataNovinki
        
        //When
        try sut.addCity(cityDataObject)
        try sut.save()
        
        //Then
        let cities = try sut.fetchCities()
        XCTAssertEqual(cities.count, 1)
    }
    
    func testPersistenceService_WhenDeleteCity_ThenShouldBeSuccess() throws {
        //Given
        let cityDataObject = TestDomainConstants.cityDataNovinki
        
        //When
        try sut.deleteCity(city: cityDataObject)
        try sut.save()
        
        //Then
        let cities = try sut.fetchCities()
        XCTAssertEqual(cities.count, 0)
    }
    
    func testPersistenceService_WhenFetchCities_ThenShouldBeSuccess() throws {
        //Given
        try sut.addCity(TestDomainConstants.cityDataHurzuf)
        try sut.save()
        
        //When
        let cities = try sut.fetchCities()
        
        //Then
        XCTAssertEqual(cities.count, 1)
    }
    
}
