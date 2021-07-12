//
//  ManagerBooksService.swift
//  recruitment-tests-ahmed-chebbiTests
//
//  Created by Chebbi on 12/07/2021.
//

import XCTest
@testable import recruitment_tests_ahmed_chebbi

class MockBooksService: BooksServiceProtocol {
    
    let book1 = Book(isbn: "c8fabf68-8374-48fe-a7ea-a00ccd07afff"
                     , title: "Henri Potier à l'école des sorciers 1"
                     , price: 25
                     , cover: "https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media"
                     , synopsis: ["Resum1","Resum2"])
    
    let book2 = Book(isbn: "c8fabf68-8374-48fe-a7ea-a00ccd07affa"
                     , title: "Henri Potier à l'école des sorciers 2"
                     , price: 30
                     , cover: "https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media"
                     , synopsis: ["Resum1","Resum2"])
    
    let book3 = Book(isbn: "c8fabf68-8374-48fe-a7ea-a00ccd07affB"
                     , title: "Henri Potier à l'école des sorciers 3"
                     , price: 15
                     , cover: "https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media"
                     , synopsis: ["Resum1","Resum2"])
    
    let book4 = Book(isbn: "c8fabf68-8374-48fe-a7ea-a00ccd07aff5"
                     , title: "Henri Potier à l'école des sorciers 4"
                     , price: 40
                     , cover: "https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media"
                     , synopsis: ["Resum1","Resum2"])

    
    var books: [Book] = []
    
    let offer1 = Offer(type: "percentage",
                       value: 8.0,
                       sliceValue: nil)
    let offer2 = Offer(type: "minus",
                       value: 30.0,
                       sliceValue: nil)
    let offer3 = Offer(type: "slice",
                       value: 14.0,
                       sliceValue: 80)
    
    private var responseOffers: ResponseOffers

    init() {
        books = [book1,book2,book3,book4]
        responseOffers = ResponseOffers(offers: [offer1,offer2,offer3])
    }
    
    func fetchAllBooks(completion: @escaping (([Book]) -> Void)) {
        completion(books)
    }
    
    func fetchOffers(basket: [Book], completion: @escaping ((ResponseOffers?) -> Void)) {
        completion(responseOffers)
    }
}
