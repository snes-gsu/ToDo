//
//  SwiftUIToDoApp.swift
//  SwiftUIToDo
//
//  Created by sade on 12/20/22.
//

import SwiftUI

@main
struct SwiftUIToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
