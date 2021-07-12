//
//  BooksListViewModelSpec.swift
//  recruitment-tests-ahmed-chebbiTests
//
//  Created by Chebbi on 12/07/2021.
//

import XCTest
@testable import recruitment_tests_ahmed_chebbi

class BooksListViewModelSpec: XCTestCase {

   
    var viewModel: BooksListViewModel!
    var mockBooksService: MockBooksService!

    override func setUp() {
        mockBooksService = MockBooksService()
        viewModel = .init(service: mockBooksService, serviceBasket: ManagerBaskets.shared)
    }
    
    func testBookViewModel(){
        let book = Book(isbn: "c8fabf68-8374-48fe-a7ea-a00ccd07aff5"
                         , title: "Henri Potier à l'école des sorciers 4"
                         , price: 40
                         , cover: "https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media"
                         , synopsis: ["Resum1","Resum2"])
        let bookViewModel = BookViewModel(book: book)
        
        XCTAssertEqual(bookViewModel.displayPrice, "€ \(book.price ?? 0).00")
        XCTAssertEqual(bookViewModel.displaySynopsisCount, "Synopsis: \(book.synopsis?.count ?? 0) paragraphs")
        XCTAssertEqual(bookViewModel.displayTitle, book.title)
    }
    
    func testFetchCountAllBooks(){
        viewModel.fetchAllBooks { booksViewModels in
            XCTAssertEqual(booksViewModels.count, self.mockBooksService.books.count)
        }
    }
    
    func testCountBasketWithEmptyBasket(){
        XCTAssert(viewModel.countBooksInBaskets() == "Basket")
    }
    
    func testCountBasketWithNoneEmptyBasket(){
        ManagerBaskets.shared.add(book: mockBooksService.book1)
        ManagerBaskets.shared.add(book: mockBooksService.book2)

        XCTAssert(viewModel.countBooksInBaskets() == "Basket \(ManagerBaskets.shared.countBooksBaskets())")
    }
}
