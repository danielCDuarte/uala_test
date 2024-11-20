//
//  CitiesRepositories.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Foundation

class CitiesRepositories: CitiesRepositoriesType {
    private(set) var networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func getCities() -> AnyPublisher<[CityObject], any Error> {
        let endPoint = NetworkRequest<[APICityResponse]>(
            method: .GET,
            relativePath:DataConstants.WS.cities,
            parameters: nil
        )
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { CitiesMapper.map(input: $0) }
        .eraseToAnyPublisher()
    }
    
}
