//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by sade on 12/23/22.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
