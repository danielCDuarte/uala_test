//
//  GetCitiesUseCase.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import Combine

class GetCitiesUseCase: AnyUseCase< Any?, [CityObject]> {
    let repository: CitiesRepositoriesType
    
    init(repository: CitiesRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: Any?) -> AnyPublisher<[CityObject], any Error> {
        return repository.getCities()
            .map { cities in
                cities.sorted {
                    if $0.name == $1.name {
                        return $0.country < $1.country
                    }
                    return $0.name < $1.name
                }
            }
            .eraseToAnyPublisher()
    }
}
