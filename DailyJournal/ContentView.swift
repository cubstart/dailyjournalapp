//
//  ContentView.swift
//  DailyJournal
//
//  Created by Justin Wong on 10/27/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var dailyJournals: [DailyJournal]
    @State private var isPresentingCreateJournalSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if dailyJournals.isEmpty {
                    VStack {
                        Text("No Journals")
                            .font(.title).bold()
                        Text("Let's create one!")
                    }
                    .foregroundStyle(.gray.opacity(0.7))
                } else {
                    dailyJournalsCountLabel
                    List(dailyJournals) { dailyJournal in
                        DailyJournalView(dailyJournal: dailyJournal)
                        .listRowSeparator(.hidden)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Daily Journals")
            .toolbar {
                Button(action: {
                    isPresentingCreateJournalSheet.toggle()
                }) {
                    Image(systemName: "plus")
                        .foregroundStyle(.indigo)
                }
            }
            .sheet(isPresented: $isPresentingCreateJournalSheet) {
                CreateDailyJournalView()
            }
        }
    }
    
    private var dailyJournalsCountLabel: some View {
        Text("\(dailyJournals.count) Journals")
            .bold()
            .padding(10)
            .background(.indigo.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct DailyJournalView: View {
    var dailyJournal: DailyJournal
    
    var body: some View {
        NavigationLink(destination: {
            DailyJournalDetailView(dailyJournal: dailyJournal)
        }) {
            VStack(alignment: .leading) {
                Text("\(dailyJournal.date.formatted(date: .abbreviated, time: .shortened))")
                    .font(.title3).bold()
                Text("\(dailyJournal.text)")
                    .foregroundStyle(.white)
            }
        }
        .padding(20)
        .background(dailyJournal.isFavorited ? .yellow: .indigo)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .listRowSeparator(.hidden)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [DailyJournal.self])
//   CreateDailyJournalView()
}
