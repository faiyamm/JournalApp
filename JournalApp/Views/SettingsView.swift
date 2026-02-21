//
//  SettingsView.swift
//  JournalApp
//
//  Created by Fai on 20/02/26.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                TextField("Your Name", text: $userName)
            }
            
            Section(header: Text("Preferences")) {
                Toggle("Dark Mode", isOn: $isDarkMode)
            }
        }
        .navigationTitle("Settings")
    }
}
