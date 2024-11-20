//
//  FavoritesViewModelSpy.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 19/11/24.
//

import Foundation
import Combine
@testable import uala_test

class FavoritesViewModelSpy: FavoritesViewModelType {
    @Published var state = FavoritesState()
    
    var onAppearCalled = false
    var deleteCityCalled = false
    var onDisAppearCalled = false
    
    func onAppear() {
        onAppearCalled = true
    }
    
    func deleteCity(with cityDataObject: uala_test.CityDataObject) {
        deleteCityCalled = true
    }
    
    func onDisAppear() {
        onDisAppearCalled = true
    }
    
    
}
