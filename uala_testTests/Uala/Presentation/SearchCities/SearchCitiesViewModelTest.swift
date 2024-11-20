//
//  SearchCitiesViewModelTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import XCTest
import Resolver
@testable import uala_test

class SearchCitiesViewModelTest: XCTestCase {
    private var sut: SearchCitiesViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = SearchCitiesViewModel(getCitiesUseCase: Resolver.resolve(AnyUseCase<Any?, [CityObject]>.self))
    }
    
    override func tearDown() {
        GetCitiesUseCaseStub.error = nil
        sut = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenReturnSuccess_ThenChangeStateCitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Cities")
        GetCitiesUseCaseStub.cities = TestDomainConstants.cities
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.cities.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenThereIsError_ThenChangeStateCitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Recipes")
        GetCitiesUseCaseStub.error = NetworkError.serverError
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alert)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSearchCities_WhenReturnSuccess_ThenChangeStateSearchCitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Cities")
        GetCitiesUseCaseStub.cities = TestDomainConstants.cities
        
        // When
        sut.onAppear()
        
        // Then
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        sut.searchCities(query: "hurzuf")
        XCTAssertTrue(!sut.state.searchCities.isEmpty)
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenStateEmptyViewDataWasChanged() {
        // When
        sut.onDisAppear()
        // Then
        XCTAssertFalse(sut.loading)
    }
    
}
