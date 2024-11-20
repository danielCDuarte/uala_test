//
//  FavoritesView.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Resolver
import SwiftUI
import SkeletonUI

struct FavoritesView<ViewModelType>: View where ViewModelType: FavoritesViewModelType {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    
    var body: some View {
        List {
            ForEach(viewModel.state.citiesFavorites) { city in
                NavigationLink {
                    DetailCityView<DetailCityViewModel>(
                        city: .init(
                            id: city.id,
                            country: city.country,
                            name: city.name,
                            coord: .init(
                                id: city.id,
                                longitude: city.longitude,
                                latitude: city.latitude
                            )
                        ),
                        isSave: true
                    )
                } label: {
                    FavoriteCellView(city: city, loading: false)
                        .swipeActions(edge: .leading) {
                            Button(role: .destructive) {
                                viewModel.deleteCity(with: city)
                            } label : {
                                Label(FavoritesState.Constants.delete,
                                      systemImage: FavoritesState.Constants.trash)
                            }
                        }
                }
            }
        }.listStyle(.inset)
        
            .onAppear {
                viewModel.onAppear()
                
            }
            .onDisappear {
                viewModel.onDisAppear()
            }
            .alert(isPresented: $viewModel.state.alert) {
                Alert(
                    title: Text(SearchCitiesState.Constants.error),
                    message: Text(SearchCitiesState.Constants.error),
                    dismissButton: .cancel(Text(SearchCitiesState.Constants.ok)))
            }
            .alert(isPresented: $viewModel.state.alertDelete) {
                Alert(
                    title: Text(FavoritesState.Constants.delete),
                    message: Text(FavoritesState.Constants.deleteMessage),
                    dismissButton: .cancel(Text(SearchCitiesState.Constants.ok)))
            }
            .navigationBarTitle(FavoritesState.Constants.title, displayMode: .inline)
        
    }
    
}
