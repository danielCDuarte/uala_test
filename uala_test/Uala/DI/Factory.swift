//
//  Factory.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import Resolver

protocol FactoryProtocol {
    init(baseUrl: String)
}

class Factory: FactoryProtocol {
    
    required init(baseUrl: String) {
        Resolver.RegisterModuleDependencies(with: baseUrl)
    }
}
