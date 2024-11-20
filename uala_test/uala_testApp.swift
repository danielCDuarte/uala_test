//
//  uala_testApp.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import SwiftUI
import SwiftData

@main
struct uala_testApp: App {
    let factory = Factory(baseUrl: DataConstants.baseUrl)
    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            SearchCitiesView<SearchCitiesViewModel>()
        }
//        .modelContainer(sharedModelContainer)
    }
}
