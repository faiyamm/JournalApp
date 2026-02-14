//
//  EntryFormView.swift
//  JournalApp
//
//  Created by Fai on 13/02/26.
//

import SwiftUI
import SwiftData

struct EntryFormView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let entry: JournalEntry?
    @State private var title: String = ""
    @State private var entryBody: String = ""
    @State private var isFavorite: Bool = false
    @State private var selectedColor: String = "#4A90E2"

    let colors = ["#00C099", "#FFE38E", "#FFB6C1", "#ADD8E6", "#4A90E2"]

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                    .font(.title3.bold())
                
                TextEditor(text: $entryBody)
                    .frame(minHeight: 250)
            }
            
            Section("Settings") {
                Toggle("Favorite", isOn: $isFavorite)
                
                HStack {
                    Text("Label Color")
                    Spacer()
                    ForEach(colors, id: \.self) { hex in
                        Circle()
                            .fill(Color(hex: hex))
                            .frame(width: 24, height: 24)
                            .overlay(Circle().stroke(Color.primary, lineWidth: selectedColor == hex ? 2 : 0))
                            .onTapGesture { selectedColor = hex }
                    }
                }
            }
        }
        .navigationTitle(entry == nil ? "New Entry" : "Edit")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    if let entry = entry {
                        entry.title = title
                        entry.body = entryBody
                        entry.isFavorite = isFavorite
                        entry.tintColor = selectedColor
                    } else {
                        context.insert(JournalEntry(title: title, body: entryBody, isFavorite: isFavorite, tintColor: selectedColor))
                    }
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
        .onAppear {
            if let entry = entry {
                title = entry.title
                entryBody = entry.body
                isFavorite = entry.isFavorite
                selectedColor = entry.tintColor
            }
        }
    }
}
