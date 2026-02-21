# JournalApp

A native iOS journal application built with SwiftUI and SwiftData. 

## Features
* **Create & Edit Entries:** Write journal entries with titles, bodies, and custom color labels.
* **Favorites:** Mark specific entries as favorites for quick access.
* **Search & Filter:** Search through past entries and toggle a favorites-only view.
* **Archiving:** Move older or private entries to a dedicated archive section to keep the main list clean.
* **Settings:** Basic user preferences saved persistently.

## Implementation Details
* **Framework:** SwiftUI for the declarative user interface.
* **Data Persistence:** * **SwiftData:** Used for handling the core `JournalEntry` model, allowing persistent storage, querying, and deletion of entries.
  * **AppStorage:** Used for lightweight UserDefaults storage, specifically for managing user settings (like user name and dark mode preferences) in `SettingsView`.
* **Architecture:** View-driven architecture utilizing the `@Environment(\.modelContext)` for database operations (insert, delete, update).

## Project Structure
* `Models/`: Contains the `JournalEntry` SwiftData model and color hex extensions.
* `Views/`: 
  * `EntryListView`: Main dashboard displaying active entries.
  * `EntryDetailView`: Read-only view of a single entry with options to edit or archive.
  * `EntryFormView`: Input form for creating and updating entries.
  * `ArchivedEntriesView`: Dedicated list for entries marked as `isArchived`.
  * `SettingsView`: User preference toggles using `@AppStorage`.
