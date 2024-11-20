//
//  SearchCitiesViewModel.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Resolver
import Foundation

final class SearchCitiesViewModel: BaseViewModel {
    
    private var cities: [CityObject]?
    private var subscribers: Set<AnyCancellable> = []
    @Published var state = SearchCitiesState()
    private let getCitiesUseCase: AnyUseCase< Any?, [CityObject]>
    
    init(getCitiesUseCase: AnyUseCase< Any?, [CityObject]>) {
        self.getCitiesUseCase = getCitiesUseCase
        super.init()
        errorHandler = self
    }
    
    private func getCities() {
        getCitiesUseCase.execute(params: nil)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] cities in
                self?.bindCities(with: cities)
            }
            .store(in: &subscribers)
        
    }
    
    private func bindCities(with citiesObject: [CityObject]) {
        cities = citiesObject
        state.cities = citiesObject
        state.isLoading = false
        objectWillChange.send()
    }
    
    private func searchCities(by query: String) {
        let filterResults = cities?.filter { cities in
            cities.description
                .lowercased()
                .contains(query)
        } ?? []
        state.searchCities = filterResults
        state.isLoading = false
        objectWillChange.send()
    }
    
}

extension SearchCitiesViewModel: SearchCitiesViewModelType {
    func searchCities(query: String) {
        searchCities(by: query)
    }
    
    func onAppear() {
        getCities()
    }
    
    func onDisAppear() {
        loading = false
    }
    
}

extension SearchCitiesViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
