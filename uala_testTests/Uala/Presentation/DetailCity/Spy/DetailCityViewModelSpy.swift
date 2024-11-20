//
//  DetailCityViewModelSpy.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 19/11/24.
//

import Foundation
import Combine
@testable import uala_test

class DetailCityViewModelSpy: DetailCityViewModelType {
    @Published var state = DetailCityState()
    
    var saveCityCalled = false
    var onAppearCalled = false
    var onDisAppearCalled = false
   
    
    func saveCity(_ city: uala_test.CityObject?) {
        saveCityCalled = true
    }
    
    func onAppear(isSave: Bool) {
        onAppearCalled = true
    }
    
    func onDisAppear() {
        onDisAppearCalled = true
    }
    
    
    
}
