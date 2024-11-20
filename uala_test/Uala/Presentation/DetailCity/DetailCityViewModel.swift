//
//  DetailCityViewModel.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Combine
import Resolver
import Foundation

final class DetailCityViewModel: BaseViewModel {
    private var city: CityObject?
    @Published var state = DetailCityState()
    
    private let persistenceService: PersistenceServiceType
    
    init(persistenceService: PersistenceServiceType) {
        self.persistenceService = persistenceService
        super.init()
        errorHandler = self
    }
}

extension DetailCityViewModel: DetailCityViewModelType {
    func onAppear(isSave: Bool) {
        state.isSelectedLike = isSave
        objectWillChange.send()
    }
    
    func saveCity(_ city: CityObject?) {
        guard let city = city else { return }
        let cityDataObject = CityDataObject(
            id: city.id,
            country: city.country,
            name: city.name,
            longitude: city.coord.longitude,
            latitude: city.coord.latitude,
            desc: city.description
        )
        do {
            try persistenceService.addCity(cityDataObject)
            try persistenceService.save()
            state.alertSave = true
            state.isSelectedLike = true
            objectWillChange.send()
        } catch let error {
            showError(error: error)
        }
    }
    
    func onDisAppear() {
        loading = false
    }
}

extension DetailCityViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
