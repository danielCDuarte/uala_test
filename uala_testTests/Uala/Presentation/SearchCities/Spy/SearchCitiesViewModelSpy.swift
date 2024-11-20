//
//  SearchCitiesViewModelSpy.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 19/11/24.
//

import Foundation
import Combine
@testable import uala_test

class SearchCitiesViewModelSpy: SearchCitiesViewModelType {
    @Published var state = SearchCitiesState()
    
    var searchCitiesCalled = false
    var onAppearCalled = false
    var onDisAppearCalled = false
    
    func searchCities(query: String) {
        searchCitiesCalled = true
    }
    
    func onAppear() {
        onAppearCalled = true
    }
    
    func onDisAppear() {
        onDisAppearCalled = true
    }
}
