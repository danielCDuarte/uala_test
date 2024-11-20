//
//  APICityResponse.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

struct APICityResponse: Codable {
    var id: Int
    var country: String
    var name: String
    var coord: APICoordResponse
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id",country, name, coord
    }
}
