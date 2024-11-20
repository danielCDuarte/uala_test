//
//  FavoritesViewModel.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Resolver
import Foundation

final class FavoritesViewModel: BaseViewModel {
    private var citiesFavorites: [CityDataObject]?
    @Published var state = FavoritesState()
    
    private let persistenceService: PersistenceServiceType
    
    init(persistenceService: PersistenceServiceType) {
        self.persistenceService = persistenceService
        super.init()
        errorHandler = self
    }

    private func getFavoriteCities() {
        do {
            let cities = try persistenceService.fetchCities()
            bindCities(with: cities)
        } catch let error {
            showError(error: error)
        }
    }
    
    private func bindCities(with cities: [CityDataObject]?) {
        citiesFavorites = cities
        state.citiesFavorites = cities ?? []
        state.isLoading = false
        objectWillChange.send()
    }
}

extension FavoritesViewModel: FavoritesViewModelType {
    
    func onAppear() {
        state.isLoading = true
        objectWillChange.send()
        getFavoriteCities()
    }
    
    func onDisAppear() {
        loading = false
    }
    
    func deleteCity(with cityDataObject: CityDataObject) {
        do {
            try persistenceService.deleteCity(city: cityDataObject)
            try persistenceService.save()
            state.alertDelete = true
            objectWillChange.send()
            getFavoriteCities()
        } catch let error {
            showError(error: error)
        }
    }
}

extension FavoritesViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
