//
//  FavoritesViewModelTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import XCTest
import Resolver
@testable import uala_test

class FavoritesViewModelTest: XCTestCase {
    private var sut: FavoritesViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = FavoritesViewModel(persistenceService:  Resolver.resolve(PersistenceServiceType.self))
    }
    
    override func tearDown() {
        sut = nil
        PersistenceServiceMock.error = nil
        PersistenceServiceMock.response = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenReturnSuccess_ThenChangeStateCitiesFavoritesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Cities favorites")
        PersistenceServiceMock.response = TestDomainConstants.citiesData
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.citiesFavorites.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenThereIsError_ThenChangeStateAlertWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Cities favorites")
        PersistenceServiceMock.error = NetworkError.serverError
        
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
    
    func testDeleteCity_WhenReturnSuccess_ThenChangeStateAlertDeleteWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "delete City favorites")
        
        // When
        sut.deleteCity(with: TestDomainConstants.cityDataHurzuf)
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alertDelete)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testDeleteCity_WhenThereIsError_ThenChangeStateAlertWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Cities favorites")
        PersistenceServiceMock.error = NetworkError.serverError
        
        // When
        sut.deleteCity(with: TestDomainConstants.cityDataHurzuf)
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alert)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenStateEmptyViewDataWasChanged() {
        // When
        sut.onDisAppear()
        // Then
        XCTAssertFalse(sut.loading)
    }
    
}
