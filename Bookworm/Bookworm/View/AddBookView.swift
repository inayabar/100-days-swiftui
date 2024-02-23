//
//  AddBookView.swift
//  Bookworm
//
//  Created by Iñaki Yabar Bilbao on 23/02/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var author: String = ""
    @State var genre: String = ""
    @State var review: String = ""
    @State var rating: Int = 3
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                Picker("Genre", selection: $genre, content: {
                    ForEach(Genre.allCases, id: \.rawValue) { genre in
                        Text(genre.rawValue)
                    }
                })
            }
            
            Section("Review") {
                TextEditor(text: $review)
                
                RatingView(rating: $rating, label: "Rating")
            }
            
            Section {
                Button("Save") {
                    let book = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    modelContext.insert(book)
                    dismiss()
                }
            }
        }
        .navigationTitle("Add book")
    }
}

#Preview {
    AddBookView()
}
