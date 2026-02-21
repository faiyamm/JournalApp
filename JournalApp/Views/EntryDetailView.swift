//
//  EntryDetailView.swift
//  JournalApp
//
//  Created by Fai on 13/02/26.
//

import SwiftUI

struct EntryDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    let entry: JournalEntry
    @State private var showingEdit = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(entry.createdAt.formatted(date: .complete, time: .shortened))
                        .font(.caption.bold())
                        .foregroundStyle(Color(hex: entry.tintColor))
                    
                    Text(entry.title)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                }
                
                Divider()
                
                Text(entry.body)
                    .font(.body)
                    .lineSpacing(8)
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(entry.isArchived ? "Unarchive" : "Archive") {
                    entry.isArchived.toggle()
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") { showingEdit = true }
            }
        }
        .sheet(isPresented: $showingEdit) {
            NavigationStack {
                EntryFormView(entry: entry)
            }
        }
    }
}
