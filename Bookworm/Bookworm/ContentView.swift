//
//  ContentView.swift
//  Bookworm
//
//  Created by Iñaki Yabar Bilbao on 22/02/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    @State private var showingAddBookSheet = false
    
    var body: some View {
        NavigationStack {
            List(books) { book in
                HStack {
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.headline)
                        Text(book.author)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    RatingView(rating: .constant(book.rating))
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book") {
                            showingAddBookSheet.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddBookSheet, content: {
                    AddBookView()
                })
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Book.self)
}
