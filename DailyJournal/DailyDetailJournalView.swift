//
//  DailyDetailJournalView.swift
//  DailyJournal
//
//  Created by Justin Wong on 10/27/23.
//

import SwiftUI

struct DailyJournalDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    var dailyJournal: DailyJournal
    
    var body: some View {
        NavigationStack {
            VStack {
                Color.indigo.opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .overlay(
                        VStack {
                            Spacer()
                            Text("\(dailyJournal.text)")
                                .foregroundStyle(.indigo)
                            Spacer()
                        }
                            .padding(30)
                    )
                    .frame(height: 300)
                HStack {
                    Spacer()
                    favoriteAndUnFavoriteButton
                    Spacer()
                    deleteButton
                    Spacer()
                }
            }
            
        }
        .navigationTitle(dailyJournal.date.formatted(date: .abbreviated, time: .shortened))
    }
    
    private var favoriteAndUnFavoriteButton: some View {
        Button(action: {
            dailyJournal.isFavorited.toggle()
        }) {
            Image(systemName: dailyJournal.isFavorited ? "star.slash" : "star")
                .foregroundStyle(.white)
                .font(.system(size: 30))
                .padding()
                .background(.yellow.opacity(0.7))
                .clipShape(Circle())
        }
    }
    
    private var deleteButton: some View {
        Button(action: {
            modelContext.delete(dailyJournal)
            dismiss()
        }) {
            Image(systemName: "trash")
                .foregroundStyle(.white)
                .font(.system(size: 30))
                .padding()
                .background(.red.opacity(0.7))
                .clipShape(Circle())
        }
    }
}

