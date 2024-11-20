//
//  GetCitiesUseCaseStub.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Foundation
@testable import uala_test

class GetCitiesUseCaseStub: AnyUseCase<Any? , [CityObject]> {
    
    static var cities: [CityObject] = TestDomainConstants.cities
    
    static var error: Error?
    
    override func execute(params: Any?) -> AnyPublisher<[CityObject], Error> {
        let publisher = CurrentValueSubject<[CityObject], Error>(GetCitiesUseCaseStub.cities)
        if let error = GetCitiesUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
