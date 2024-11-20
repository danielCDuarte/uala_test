//
//  SearchCitiesContract.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import SwiftUI

protocol SearchCitiesViewModelType: ObservableObject {
    var state: SearchCitiesState { get set }
    func searchCities(query: String)
    func onAppear()
    func onDisAppear()
}
