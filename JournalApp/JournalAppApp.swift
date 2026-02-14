//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Fai on 13/02/26.
//

import SwiftUI
import SwiftData

@main
struct JournalAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryListView()
            }
        }
        .modelContainer(for: JournalEntry.self)
    }
}
