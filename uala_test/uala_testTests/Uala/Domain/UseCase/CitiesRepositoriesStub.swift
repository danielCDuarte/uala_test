//
//  CitiesRepositoriesStub.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
@testable import uala_test

final class CitiesRepositoriesStub {
    static var error: Error?
    static var responseCities: [CityObject]!
}

extension CitiesRepositoriesStub: CitiesRepositoriesType {
    
    func getCities() -> AnyPublisher<[CityObject], any Error> {
        let data = CitiesRepositoriesStub.responseCities ?? []
        let publisher = CurrentValueSubject<[CityObject], Error>(data)
        
        if let error = CitiesRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
