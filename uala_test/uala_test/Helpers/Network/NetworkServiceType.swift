//
//  NetworkServiceType.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Foundation

protocol NetworkServiceType {
    func setBaseUrl(_ baseUrl: String)
        
    func request<Response>(
        _ endpoint: NetworkRequest<Response>,
        queue: DispatchQueue) -> AnyPublisher<Response, Error> where Response: Decodable
}
