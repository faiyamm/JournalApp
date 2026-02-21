//
//  ArchivedEntriesView.swift
//  JournalApp
//
//  Created by Fai on 20/02/26.
//

import SwiftUI
import SwiftData

struct ArchivedEntriesView: View {
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<JournalEntry> { $0.isArchived == true }, sort: \JournalEntry.createdAt, order: .reverse) private var archivedEntries: [JournalEntry]

    var body: some View {
        List {
            if archivedEntries.isEmpty {
                ContentUnavailableView("No Archives", systemImage: "archivebox")
            } else {
                ForEach(archivedEntries) { entry in
                    NavigationLink(destination: EntryDetailView(entry: entry)) {
                        VStack(alignment: .leading) {
                            Text(entry.title).font(.headline)
                            Text(entry.createdAt.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteRows)
            }
        }
        .navigationTitle("Archived Entries")
    }

    private func deleteRows(at offsets: IndexSet) {
        for i in offsets {
            context.delete(archivedEntries[i])
        }
    }
}
