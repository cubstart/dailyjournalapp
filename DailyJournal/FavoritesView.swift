//
//  FavoritesView.swift
//  DailyJournal
//
//  Created by Justin Wong on 10/27/23.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query(filter: #Predicate<DailyJournal> { dailyJournal in
        dailyJournal.isFavorited
    }) var favoritedDailyJournals: [DailyJournal]
    
    var body: some View {
        NavigationStack {
            VStack {
                if favoritedDailyJournals.isEmpty {
                    VStack {
                        Image(systemName: "star")
                            .font(.system(size: 80))
                        VStack {
                            Text("No Favorited Journals")
                                .bold()
                            Text("Let's favorite one!")
                        }
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                    .foregroundStyle(.gray.opacity(0.7))
                } else {
                    List(favoritedDailyJournals) { favoritedDailyJournal in
                        DailyJournalView(dailyJournal: favoritedDailyJournal)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
}
