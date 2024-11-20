//
//  Module+Injection.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import Resolver
import SwiftData

extension Resolver {
    static func RegisterModuleDependencies (with baseUrl: String){
        registerData(with: baseUrl)
        registerDomain()
        registerPresentation()
    }
    
}

extension Resolver {
    static func registerData(with baseUrl: String) {
        register {
            URLSession(configuration: URLSession.configuration())
        }
        register {
            NetworkService(url: baseUrl, urlSession: resolve(URLSession.self))
        }.implements(NetworkServiceType.self)
        
        register {
            CitiesRepositories(networkService: resolve(NetworkServiceType.self))
        }.implements(CitiesRepositoriesType.self)
        
    }
    
    static func registerDomain(){
        register {
            GetCitiesUseCase(repository: resolve(CitiesRepositoriesType.self))
        }.implements( AnyUseCase<Any?, [CityObject]>.self)
        
        let sharedModelContainer: ModelContainer = {
            let schema = Schema([
                CityDataObject.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        
        register {
            PersistenceService(container: sharedModelContainer)
        }.implements(PersistenceServiceType.self)
        
    }
    
    static func registerPresentation() {
        register(SearchCitiesViewModel.self){ _ in
            return SearchCitiesViewModel(getCitiesUseCase: resolve(AnyUseCase<Any?, [CityObject]>.self))
        }
        
        register(DetailCityViewModel.self){ _ in
            return DetailCityViewModel(persistenceService: resolve(PersistenceServiceType.self))
        }
        
        register(FavoritesViewModel.self){ _ in
            return FavoritesViewModel(persistenceService: resolve(PersistenceServiceType.self))
        }
    }
    
}
