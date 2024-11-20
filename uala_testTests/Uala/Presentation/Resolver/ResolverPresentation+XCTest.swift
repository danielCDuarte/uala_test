//
//  ResolverPresentation+XCTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import Resolver
@testable import uala_test

extension Resolver  {
    
    static func registerPresentationMockServices() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register {
            GetCitiesUseCaseStub()
        }.implements( AnyUseCase<Any?, [CityObject]>.self)
        
        mock.register {
            PersistenceServiceMock()
        }.implements(PersistenceServiceType.self)
        
    }
    
}
