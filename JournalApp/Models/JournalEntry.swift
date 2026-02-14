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
    var title: String
    var body: String
    var createdAt: Date
    var isFavorite: Bool
    var tintColor: String

    init(title: String, body: String, createdAt: Date = .now, isFavorite: Bool = false, tintColor: String = "#4A90E2") {
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.isFavorite = isFavorite
        self.tintColor = tintColor
    }
}
