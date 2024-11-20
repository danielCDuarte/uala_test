//
//  DetailCityViewModelTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import XCTest
import Resolver
@testable import uala_test

class DetailCityViewModelTest: XCTestCase {
    private var sut: DetailCityViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = DetailCityViewModel(persistenceService:  Resolver.resolve(PersistenceServiceType.self))
    }
    
    override func tearDown() {
        sut = nil
        PersistenceServiceMock.error = nil
        PersistenceServiceMock.response = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenThereIsChangeState_ThenStateIsSelectedLikeWasChanged() {
        // When
        sut.onAppear(isSave: false)
        // Then
        XCTAssertFalse(sut.state.isSelectedLike)
    }
    
    func testSaveCity_WhenReturnSuccess_ThenChangeStateCitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "save Cities")
        
        // When
        sut.saveCity(TestDomainConstants.city)
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alertSave)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSaveCity_WhenThereIsError_ThenChangeStateCitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Recipes")
        PersistenceServiceMock.error = NetworkError.serverError
        
        // When
        sut.saveCity(TestDomainConstants.city)
        
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
