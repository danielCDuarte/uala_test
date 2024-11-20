//
//  GetCitiesUseCaseTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Resolver
@testable import uala_test
import XCTest

class GetCitiesUseCaseTest: XCTestCase {
    private var sut: GetCitiesUseCase!
    @LazyInjected var weatherRepositories: CitiesRepositoriesStub
    private var cancellable: AnyCancellable?
    
    override func setUpWithError() throws {
        Resolver.registerDomainMockServices()
        sut = .init(repository: Resolver.resolve(CitiesRepositoriesType.self))
    }
    
    override func tearDownWithError() throws {
        sut = nil
        cancellable = nil
        CitiesRepositoriesStub.error = nil
        CitiesRepositoriesStub.responseCities = nil
    }
    
    func testGetCitiesByQueryUseCase_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        CitiesRepositoriesStub.responseCities = TestDomainConstants.cities
        
        //When
        cancellable = sut.execute(params: nil)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // Then
                XCTAssertFalse(response.isEmpty)
                expectation.fulfill()
            }
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
    
    func testGetCitiesByQueryUseCase_ResponseError() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        
        CitiesRepositoriesStub.error = NetworkError.emptyJson
        
        //When
        cancellable = sut.execute(params: nil)
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return
                        XCTFail("completion is not a failure")
                    }
                    // Then
                    let jsonEmptyError = NetworkError.emptyJson.localizedDescription
                    XCTAssertEqual(error.localizedDescription, jsonEmptyError)
                    expectationFailure.fulfill()
                },
                receiveValue: { _ in
                    expectation.fulfill()
                })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
}
