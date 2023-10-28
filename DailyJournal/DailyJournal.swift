//
//  DailyJournal.swift
//  DailyJournal
//
//  Created by Justin Wong on 10/27/23.
//

import Foundation
import SwiftData

@Model
class DailyJournal {
    var text: String
    var date: Date
    var isFavorited: Bool
    
    init(text: String, date: Date, isFavorited: Bool) {
        self.text = text
        self.date = date
        self.isFavorited = isFavorited
    }
}
