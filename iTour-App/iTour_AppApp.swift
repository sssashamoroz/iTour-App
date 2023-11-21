//
//  iTour_AppApp.swift
//  iTour-App
//
//  Created by Aleksandr Morozov on 17/11/23.
//

import SwiftUI
import SwiftData 

@main
struct iTour_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DestinationModel.self) // Swift Data (Step 3. Add Context to view group)

    }
}
