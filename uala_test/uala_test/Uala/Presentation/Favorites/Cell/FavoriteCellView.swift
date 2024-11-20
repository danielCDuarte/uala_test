//
//  FavoriteCellView.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import SkeletonUI
import SwiftUI

struct FavoriteCellView: View {
    var city: CityDataObject?
    var loading: Bool
    
    
    init(city: CityDataObject?,
         loading: Bool) {
        self.city = city
        self.loading = loading
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Text(city?.desc)
                .font(.subheadline)
                .foregroundColor(.black)
                .skeleton(with: loading ,appearance: .gradient())
            Spacer()
        }
    }
}
