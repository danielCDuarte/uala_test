//
//  ResolverDomain+XCTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import Resolver
@testable import uala_test

extension Resolver  {
    static var mock = Resolver(child: .main)
    
    static func registerDomainMockServices() {
        root = Resolver.mock
        defaultScope = .application
        mock.register { CitiesRepositoriesStub() }
            .implements(CitiesRepositoriesType.self)
        
    }
    
}
