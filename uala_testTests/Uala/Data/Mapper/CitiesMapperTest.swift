//
//  CitiesMapperTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

@testable import uala_test
import XCTest

class CitiesMapperTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testCitiesMapper_WhenInputIsFilled_ThenReturnObjectFilled() throws {
        // Given
        let input = TestDataConstants.citiesResponse
        // when
        let result = CitiesMapper.map(input: input)
        // then
        XCTAssertEqual(result.count, input.count)
    }
}
