//
//  BooksListViewModel.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import Foundation

struct BooksListViewModel {
    
    private let service : BooksServiceProtocol
    var coordinator: BooksListCoordinator?
    
    init(service: BooksServiceProtocol = ManagerBooksService()){
        self.service = service
    }
    
    init(service: BooksServiceProtocol = ManagerBooksService(),coordinator: BooksListCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func fetchAllBooks(completion: @escaping ([BookViewModel]) -> Void) {
        service.fetchAllBooks { (resources) in
            var data: [BookViewModel] = []
            resources.forEach { (resource) in
                data.append(BookViewModel(book: resource))
            }
            completion(data)
        }        
    }
    
}
