//
//  Jet2TravelApp.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI
import CoreData

@main
struct Jet2TravelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, DataStore.shared.persistentContainer.viewContext)
        }
    }
}
