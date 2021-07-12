//
//  CommercialOfferViewModel.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import Foundation

struct CommercialOfferViewModel {
    
    private let service : BasketsServiceProtocol
    private let coordinator: CommercialOfferCoordinator?

    init(service: BasketsServiceProtocol = ManagerBaskets.shared,coordinator: CommercialOfferCoordinator){
        self.service = service
        self.coordinator = coordinator
    }
 
    func fetchAllBooks(completion: @escaping ([(BookViewModel,Int)]) -> Void) {
        var data: [(BookViewModel,Int)] = []
        let books = service.fetchAllBooks().reduce(into: [:]) { $0[$1, default: 0] += 1 }
        books.forEach { (book,count) in
            data.append((BookViewModel(book: book),count))
        }
        completion(data)
    }
    
 
  
    
}
