//
//  EntryListView.swift
//  JournalApp
//
//  Created by Fai on 13/02/26.
//

import SwiftUI
import SwiftData

struct EntryListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.createdAt, order: .reverse) private var entries: [JournalEntry]

    @State private var searchText: String = ""
    @State private var showFavoritesOnly: Bool = false

    private var filteredEntries: [JournalEntry] {
        var result = showFavoritesOnly ? entries.filter { $0.isFavorite } : entries
        if !searchText.isEmpty {
            result = result.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.body.localizedCaseInsensitiveContains(searchText) }
        }
        return result
    }

    var body: some View {
        List {
            if filteredEntries.isEmpty {
                ContentUnavailableView(
                    "No entries",
                    systemImage: "book.closed",
                    description: Text("Tap + to add your first journal entry.")
                )
                .listRowBackground(Color.clear)
            } else {
                ForEach(filteredEntries) { entry in
                    NavigationLink(destination: EntryDetailView(entry: entry)) {
                        HStack(spacing: 15) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(hex: entry.tintColor))
                                .frame(width: 5)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(entry.title)
                                    .font(.headline)
                                    .lineLimit(1)
                                
                                Text(entry.body)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                                
                                Text(entry.createdAt.formatted(date: .abbreviated, time: .omitted))
                                    .font(.caption2)
                                    .foregroundStyle(.tertiary)
                            }
                            
                            Spacer()
                            
                            if entry.isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                    .font(.caption)
                                    .padding(.trailing, 4)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: deleteRows)
            }
        }
        .navigationTitle("My Journal")
        .searchable(text: $searchText)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button { showFavoritesOnly.toggle() } label: {
                    Image(systemName: showFavoritesOnly ? "star.fill" : "star")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                NavigationLink(destination: EntryFormView(entry: nil)) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Entry")
                    }
                    .font(.headline)
                }
            }
        }
    }

    private func deleteRows(at offsets: IndexSet) {
        for i in offsets {
            context.delete(filteredEntries[i])
        }
    }
}
