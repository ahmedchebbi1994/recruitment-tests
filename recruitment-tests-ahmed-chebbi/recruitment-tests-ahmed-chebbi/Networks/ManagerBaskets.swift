//
//  ManagerBaskets.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import Foundation

protocol BasketsServiceProtocol {
    func add(book: Book)
    func countBooksBaskets() -> Int
    func fetchAllBooks() -> [Book]
}


class ManagerBaskets: BasketsServiceProtocol {
    
    static var shared =  ManagerBaskets()
    
    private var booksBaskets: [Book] = []
 
    func add(book: Book) {
        booksBaskets.append(book)
        NotificationCenter.default.post(name: Notification.Name("BookAdded"), object: nil)

    }
    
    func fetchAllBooks() -> [Book] {
        return booksBaskets
    }
    
    func countBooksBaskets() -> Int {
        return booksBaskets.count
    }
    
}
