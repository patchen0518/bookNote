//
//  BookNotesApp.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/6/7.
//

import SwiftUI

@main
struct BookNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
