//
//  CreateDailyJournalView.swift
//  DailyJournal
//
//  Created by Justin Wong on 10/27/23.
//

import SwiftUI

struct CreateDailyJournalView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var journalText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo.ignoresSafeArea()
                VStack {
                    Spacer()
                    mainNoteCard
                    Spacer()
                    createNewDailyJournalButton
                    Spacer()
                }
            }
            .navigationTitle("Create New Daily Journal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.indigo.opacity(0.7))
                            .font(.system(size: 25))
                    }
                }
            }
        }
    }
    
    private var mainNoteCard: some View {
        VStack {
            Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                .font(.title3).bold()
            TextEditor(text: $journalText)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.indigo, lineWidth: 2)
                )
                .padding()
                .frame(height: 300)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .shadow(color: .indigo.opacity(0.5), radius: 30)
    }
    
    private var createNewDailyJournalButton: some View {
        Button(action: {
            let newDailyJournal = DailyJournal(text: journalText, date: Date(), isFavorited: false)
            modelContext.insert(newDailyJournal)
            dismiss()
        }) {
            Text("Create New Daily Journal")
                .foregroundStyle(.white)
                .font(.title2).bold()
                .padding()
                .background(.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}
