//
//  CityDataObject.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import SwiftData
import Foundation

@Model
class CityDataObject {
    var id: Int
    var country: String
    var name: String
    var longitude: Double
    var latitude: Double
    var desc: String = ""
    
    init(id: Int, country: String, name: String, longitude: Double, latitude: Double, desc: String) {
        self.id = id
        self.country = country
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.desc = "\(name), \(country)"
    }
}
