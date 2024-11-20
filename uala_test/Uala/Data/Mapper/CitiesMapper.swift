//
//  CitiesMapper.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

struct CitiesMapper: MapperType {
    typealias Input = [APICityResponse]
    typealias Output = [CityObject]
    
    static func map(input: [APICityResponse]) -> [CityObject] {
        let cities = input.map {
            getCity(input: $0)
        }
        return cities
    }
    
    private static func getCity(input: APICityResponse) -> CityObject {
        return CityObject(
            id: input.id,
            country: input.country,
            name: input.name,
            coord: getLocation(id: input.id, input: input.coord)
        )
    }
    
    private static func getLocation(id: Int,input: APICoordResponse) -> CoordObject {
        return CoordObject(
            id: id,
            longitude: input.longitude,
            latitude: input.latitude
        )
    }
    
}
