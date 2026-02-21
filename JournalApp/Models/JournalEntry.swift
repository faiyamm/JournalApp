//
//  JournalEntry.swift
//  JournalApp
//
//  Created by Fai on 13/02/26.
//

import Foundation
import SwiftData

@Model
final class JournalEntry {
    var title: String = ""
    var body: String = ""
    var createdAt: Date = Date.now
    var isFavorite: Bool = false
    var tintColor: String = "#4A90E2"
    var isArchived: Bool = false

    init(title: String, body: String, createdAt: Date = .now, isFavorite: Bool = false, tintColor: String = "#4A90E2", isArchived: Bool = false) {
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.isFavorite = isFavorite
        self.tintColor = tintColor
        self.isArchived = isArchived
    }
}
