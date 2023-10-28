//
//  DailyJournalApp.swift
//  DailyJournal
//
//  Created by Justin Wong on 10/27/23.
//

import SwiftUI

@main
struct DailyJournalApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Journals", systemImage: "note.text")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
            }
            .modelContainer(for: [DailyJournal.self])
        }
    }
}
