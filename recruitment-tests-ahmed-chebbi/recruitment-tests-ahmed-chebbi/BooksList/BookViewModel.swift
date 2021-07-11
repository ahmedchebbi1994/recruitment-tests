//
//  BookViewModel.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

struct BookViewModel {
    
    let book: Book
 
 
    var displayTitle: String {
        return book.title ?? ""
    }
    
    var displayCoverUrl: String {
        return book.cover ?? ""
    }
 
    var displayPrice: String {
        return "€ \(book.price ?? 0).00"
    }
    
    var displaySynopsisCount: String {
        return "Synopsis: \(book.synopsis?.count ?? 0) paragraphs"
    }
    
    init(book: Book) {
        self.book = book
    }
}
