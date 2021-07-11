//
//  ManagerBooksService.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import Foundation

protocol BooksServiceProtocol {
    func fetchAllBooks(completion: @escaping (([Book]) -> Void))
    func fetchOffers(basket: [Book], completion: @escaping ((ResponseOffers?) -> Void))
}


class ManagerBooksService: ApiService, BooksServiceProtocol {
        
    /// This function returns a welcoming string for a given `subject`.
    ///
    /// ```
    /// manager.fetchAllBooks { mybooks in  print(mybooks)}
    /// ```
    /// - Warning: The returned is a empty or full array of book using completion
    /// - Returns: arrays of books depends using  Rest Api  (books)
    func fetchAllBooks(completion: @escaping (([Book]) -> Void)) {
        let booksList: String = Path.BaseUrl.path.rawValue + Path.BaseUrl.books.rawValue
        
        loadData(object: [Book].self,path: booksList) { isValid, response in
            if isValid {
                if let response = response {
                    completion(response)
                }
            } else {
                completion([])
            }
        }
    }
    
    /// This function returns the commercial offer  for a given list of books `basket`.
    ///
    /// ```
    /// manager.fetchOffers(basket: [book1,book2]) { response in print(response?.offers.count) }
    /// ```
    ///
    /// - Warning: The returned optional object can be 'nil'
    /// - Parameter basket: array of books.
    /// - Returns: ResponseOffers
    func fetchOffers(basket: [Book], completion: @escaping ((ResponseOffers?) -> Void)) {
        
        let offerPath = generatePathOffer(basket)
        
        loadData(object: ResponseOffers.self, path: offerPath) { (isValid, response) in
            if isValid {
                if let response = response {
                    completion(response)
                }
            } else {
                completion(nil)
            }
        }
        

    }
        
    // Generate path commercial offer from array of books
    fileprivate func generatePathOffer(_ basket: [Book]) -> String{
        var booksOffers: String = Path.BaseUrl.path.rawValue
            + Path.BaseUrl.books.rawValue
            + "/"
        
        basket.forEach { book in
            booksOffers += book.isbn
            booksOffers += ","
        }
                
        booksOffers += "/"
        booksOffers += Path.BaseUrl.commercialOffers.rawValue
        
        return booksOffers
    }
    
}
