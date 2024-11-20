//
//  FavoritesContract.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import SwiftUI

protocol FavoritesViewModelType: ObservableObject {
    var state: FavoritesState { get set }
    func onAppear()
    func deleteCity(with cityDataObject: CityDataObject)
    func onDisAppear()
}
