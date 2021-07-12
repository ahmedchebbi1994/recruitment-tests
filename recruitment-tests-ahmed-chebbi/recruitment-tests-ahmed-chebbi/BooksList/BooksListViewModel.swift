//
//  BooksListViewModel.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import Foundation

struct BooksListViewModel {
    
    private let service : BooksServiceProtocol
    private let serviceBasket: BasketsServiceProtocol
    var coordinator: BooksListCoordinator?
    
    init(service: BooksServiceProtocol = ManagerBooksService(),serviceBasket: BasketsServiceProtocol = ManagerBaskets.shared,coordinator: BooksListCoordinator) {
        self.service = service
        self.coordinator = coordinator
        self.serviceBasket = serviceBasket
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
    
    func countBooksInBaskets() -> String{
        let count = serviceBasket.countBooksBaskets()
        if count != 0 {
            return "Basket \(count)"
        }
        return "Basket"
    }
    
    func showBaskets(){
        if serviceBasket.countBooksBaskets() != 0 {
            coordinator?.showBaskets()
        }
    }
    
    func showDetailsBook(viewModel: BookViewModel){
        coordinator?.showDetailsBook(viewModel: viewModel)
    }
    
    func updatePrefersLargeTitle(_ isTrue: Bool){
        coordinator?.updatePrefersLargeTitle(isTrue)
    }
    
}
