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
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryListView()
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .modelContainer(for: JournalEntry.self)
    }
}
