//
//  Book.swift
//  Bookworm
//
//  Created by Iñaki Yabar Bilbao on 23/02/2024.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}

enum Genre: String, CaseIterable {
    case fantasy = "Fantasy"
    case horror = "Horror"
    case kids = "Kids"
    case mystery = "Mystery"
    case poetry = "Poetry"
    case romance = "Romance"
    case thriller = "Thriller"
}
