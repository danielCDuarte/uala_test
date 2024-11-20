//
//  TestDataConstants.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation
@testable import uala_test

struct TestDataConstants {
    static let citiesResponse: [APICityResponse] = {
        [
            APICityResponse(
                id: 707860,
                country: "UA",
                name: "Hurzuf",
                coord: .init(
                    longitude: 34.283333,
                    latitude: 44.549999
                )
            ),
            APICityResponse(
                id: 519188,
                country: "RU",
                name: "Novinki",
                coord: .init(
                    longitude: 37.666668,
                    latitude: 55.683334
                )
            )
        ]
    }()
}
