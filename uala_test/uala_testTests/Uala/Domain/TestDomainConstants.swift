//
//  TestDomainConstants.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
@testable import uala_test

struct TestDomainConstants {
    static let emptyCity: CityObject = {
        CityObject(
            id: 0,
            country: "",
            name: "",
            coord: .init(
                id: 0,
                longitude: 0.0,
                latitude: 0.0
            )
        )
    }()
    
    static let city: CityObject = {
        CityObject(
            id: 707860,
            country: "UA",
            name: "Hurzuf",
            coord: .init(
                id: 707860,
                longitude: 34.283333,
                latitude: 44.549999
            )
        )
    }()
    
    static let cities: [CityObject] = {
        [
            CityObject(
                id: 707860,
                country: "UA",
                name: "Hurzuf",
                coord: .init(
                    id: 707860,
                    longitude: 34.283333,
                    latitude: 44.549999
                )
            ),
            CityObject(
                id: 519188,
                country: "RU",
                name: "Novinki",
                coord: .init(
                    id: 519188,
                    longitude: 37.666668,
                    latitude: 55.683334
                )
            )
        ]
    }()
    
    static let cityDataNovinki: CityDataObject = {
        CityDataObject(
            id: 519188,
            country: "RU",
            name: "Novinki",
            longitude: 37.666668,
            latitude: 55.683334,
            desc: "Novinki, RU"
        )
    }()
    
    static let cityDataHurzuf: CityDataObject = {
        CityDataObject(
            id: 707860,
            country: "UA",
            name: "Hurzuf",
            longitude: 34.283333,
            latitude: 44.549999,
            desc: "Hurzuf, UA"
        )
    }()
    
    static let citiesData: [CityDataObject] = {
        [
            CityDataObject(
                id: 519188,
                country: "RU",
                name: "Novinki",
                longitude: 37.666668,
                latitude: 55.683334,
                desc: "Novinki, RU"
            ),
            CityDataObject(
                id: 707860,
                country: "UA",
                name: "Hurzuf",
                longitude: 34.283333,
                latitude: 44.549999,
                desc: "Hurzuf, UA"
            )
        ]
    }()
}
