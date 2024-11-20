//
//  CityObject.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

struct CityObject: Identifiable {
    let id: Int
    let country: String
    let name: String
    let coord: CoordObject
    var description: String = ""
    
    init(id: Int, country: String, name: String, coord: CoordObject) {
        self.id = id
        self.country = country
        self.name = name
        self.coord = coord
        self.description = "\(name), \(country)"
    }
    
}
