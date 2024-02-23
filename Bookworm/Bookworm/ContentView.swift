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
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    @State private var showingAddBookSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book, label: {
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
                    })
                }
                .onDelete(perform: deleteRows)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book") {
                        showingAddBookSheet.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddBookSheet, content: {
                AddBookView()
            })
        }
    }
    
    func deleteRows(at indexSet: IndexSet) {
        for offset in indexSet {
            // find this book in our query
            let book = books[offset]
            
            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Book.self)
}
