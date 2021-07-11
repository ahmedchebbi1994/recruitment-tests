//
//  ManagerBaskets.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import Foundation

class ManagerBaskets {
    static var shared =  ManagerBaskets()
    
    private var booksBaskets: [Book] = []
    
    func add(book: Book) {
        booksBaskets.append(book)
        NotificationCenter.default.post(name: Notification.Name("BookAdded"), object: nil)

    }
    
    func countBooksBaskets() -> Int {
        return booksBaskets.count
    }
    
}
