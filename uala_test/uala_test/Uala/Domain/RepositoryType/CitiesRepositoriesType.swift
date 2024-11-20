//
//  CitiesRepositoriesType.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Foundation

protocol CitiesRepositoriesType {
    func getCities() -> AnyPublisher<[CityObject], Error>
}
