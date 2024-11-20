//
//  CoordObject.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

struct CoordObject: Identifiable {
    let id: Int
    let longitude: Double
    let latitude: Double
    
    init(id: Int, longitude: Double, latitude: Double) {
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
    }
    
}
