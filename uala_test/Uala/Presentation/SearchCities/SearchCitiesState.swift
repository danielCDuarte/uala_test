//
//  SearchCitiesState.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import SwiftUI

final class SearchCitiesState: ObservableObject {
    @Published var cities: [CityObject] = []
    @Published var searchCities: [CityObject] = []
    @Published var isLoading: Bool = true
    @Published var numberSkeletonCell: Int = 8
    @Published var alert: Bool = false
    @Published var searchText = ""
    
    enum Constants {
        static let title = "Search cities"
        static let error = "Error"
        static let errorMessage = "An error has occurred"
        static let ok = "Ok"
        static let favoriteImage:Image = Image(systemName: "star.fill")
    }
}
