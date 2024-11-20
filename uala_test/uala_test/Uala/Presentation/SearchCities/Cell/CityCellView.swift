//
//  CityCellView.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import SkeletonUI
import SwiftUI

struct CityCellView: View {
    
    var city: CityObject?
    var loading: Bool
    
    
    init(city: CityObject?,
         loading: Bool) {
        self.city = city
        self.loading = loading
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Text(city?.description)
                .font(.subheadline)
                .foregroundColor(.black)
                .skeleton(with: loading , shape: .rectangle)
            Spacer()
        }
    }
}

#Preview {
    CityCellView(
        city: CityObject(
            id: 707860,
            country: "UA",
            name: "Hurzuf",
            coord: .init(
                id: 707860,
                longitude: 34.283333,
                latitude: 44.549999
            )
        ),
        loading: false
    )
}
