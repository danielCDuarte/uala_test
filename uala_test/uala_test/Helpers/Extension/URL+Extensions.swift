//
//  URL+Extensions.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

extension URL {
    static func getUrl(from string: String?) -> URL? {
        return URL(string: string ?? "")
    }
}
