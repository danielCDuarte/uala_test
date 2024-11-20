//
//  FavoritesState.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import SwiftUI

final class FavoritesState: ObservableObject {
    @Published var citiesFavorites: [CityDataObject] = []
    @Published var isLoading: Bool = true
    @Published var numberSkeletonCell: Int = 4
    @Published var alert: Bool = false
    @Published var alertDelete: Bool = false
    
    enum Constants {
        static let title = "Cities favorites"
        static let delete = "Delete"
        static let trash = "trash"
        static let deleteMessage = "The city has been removed from favorites list"
    }
}
