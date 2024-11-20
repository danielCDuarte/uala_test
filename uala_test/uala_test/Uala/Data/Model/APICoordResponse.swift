//
//  APICoordResponse.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

struct APICoordResponse: Codable {
    
    var longitude: Double
    var latitude: Double
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
