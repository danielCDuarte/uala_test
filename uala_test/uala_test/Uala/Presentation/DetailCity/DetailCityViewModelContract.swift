//
//  DetailCityViewModelType.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import SwiftUI

protocol DetailCityViewModelType: ObservableObject {
    var state: DetailCityState { get set }
    func saveCity(_ city: CityObject?)
    func onAppear(isSave: Bool)
    func onDisAppear()
}
