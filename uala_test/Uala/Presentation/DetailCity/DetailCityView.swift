//
//  DetailCityView.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Resolver
import SwiftUI
import SkeletonUI
import MapKit

struct DetailCityView<ViewModelType>: View where ViewModelType: DetailCityViewModelType {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    
    var city: CityObject?
    var isSave: Bool = false
    
    @ViewBuilder
    var saveButtonView: some View {
        if !viewModel.state.isSelectedLike {
            Button(action: {
                viewModel.saveCity(city)
            }) {
                HStack {
                    DetailCityState.Constants.handImage
                    Text(DetailCityState.Constants.youLike)
                }
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
        }
    }
    
    @ViewBuilder
    var mapContentView: some View {
        Map(position: .constant(
            MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: city?.coord.latitude ?? 0.0,
                        longitude: city?.coord.latitude ?? 0.0
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.5,
                        longitudeDelta: 0.5
                    )
                )
            )
        )) {
            Annotation(
                city?.name ?? "",
                coordinate: CLLocationCoordinate2D(
                    latitude: CLLocationDegrees(city?.coord.latitude ?? 0.0),
                    longitude: CLLocationDegrees(city?.coord.latitude ?? 0.0))) {
                        Circle()
                            .fill(.red)
                            .frame(width: 30, height: 30)
                            .overlay {
                                Image(systemName: "mappin.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                    }
        }.mapStyle(.standard(elevation: .realistic))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(city?.description)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .skeleton(with: viewModel.state.isLoading)
            Text(DetailCityState.Constants.coordenates)
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .skeleton(with: viewModel.state.isLoading)
            Text("\(DetailCityState.Constants.latitude) \(city?.coord.latitude ?? 0.0)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .skeleton(with: viewModel.state.isLoading)
            Text("\(DetailCityState.Constants.longitude) \(city?.coord.latitude ?? 0.0)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .skeleton(with: viewModel.state.isLoading)
            saveButtonView
            mapContentView
        }
        .padding()
        .onAppear {
            viewModel.onAppear(isSave: isSave)
        }
        .onDisappear {
            viewModel.onDisAppear()
        }
        .navigationBarTitle(DetailCityState.Constants.title, displayMode: .inline)
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(DetailCityState.Constants.error),
                message: Text(DetailCityState.Constants.error),
                dismissButton: .cancel(Text(DetailCityState.Constants.ok)))
        }
        .alert(isPresented: $viewModel.state.alertSave) {
            Alert(
                title: Text(DetailCityState.Constants.titleSave),
                message: Text(DetailCityState.Constants.titleSave),
                dismissButton: .cancel(Text(DetailCityState.Constants.ok)))
        }
    }
}
