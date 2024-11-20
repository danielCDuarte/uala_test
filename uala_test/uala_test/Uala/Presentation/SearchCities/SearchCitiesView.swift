//
//  SearchCitiesView.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Resolver
import SwiftUI
import SkeletonUI

struct SearchCitiesView<ViewModelType>: View where ViewModelType: SearchCitiesViewModelType {
    
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    
    var body: some View {
        NavigationStack {
            SkeletonList(with: viewModel.state.searchText.isEmpty ? viewModel.state.cities : viewModel.state.searchCities , quantity: viewModel.state.numberSkeletonCell) { loading, city in
                NavigationLink {
                    DetailCityView<DetailCityViewModel>(city: city)
                } label: {
                    CityCellView(city: city, loading: loading)
                }
            }
            .listStyle(.inset)
            .navigationBarTitle(SearchCitiesState.Constants.title, displayMode: .inline)
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    NavigationLink {
                        FavoritesView<FavoritesViewModel>()
                    } label: {
                        SearchCitiesState.Constants.favoriteImage
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .searchable(
            text: $viewModel.state.searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .textInputAutocapitalization(.never)
        .onChange(of: viewModel.state.searchText) {
            viewModel.searchCities(query: viewModel.state.searchText)
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisAppear()
        }
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(SearchCitiesState.Constants.error),
                message: Text(SearchCitiesState.Constants.errorMessage),
                dismissButton: .cancel(Text(SearchCitiesState.Constants.ok)))
        }
    }
}
