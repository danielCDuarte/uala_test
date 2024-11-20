//
//  DetailCityState.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
import SwiftUI

final class DetailCityState: ObservableObject {
    @Published var city: CityObject?
    @Published var isLoading: Bool = false
    @Published var alert: Bool = false
    @Published var alertSave: Bool = false
    @Published var isSelectedLike: Bool = false
    
    enum Constants {
        static let title = "City"
        static let location = "Location :"
        static let error = "Error"
        static let errorMessage = "An error has occurred"
        static let ok = "Ok"
        static let titleSave = "Save"
        static let saveMessage = "The city has been saved to the favorites list"
        static let coordenates = "Coordinates:"
        static let latitude = "Latitude:"
        static let longitude = "Longitude:"
        static let youLike = "you like ?"
        static let handImage:Image = Image(systemName: "hand.thumbsup")
    }
}
