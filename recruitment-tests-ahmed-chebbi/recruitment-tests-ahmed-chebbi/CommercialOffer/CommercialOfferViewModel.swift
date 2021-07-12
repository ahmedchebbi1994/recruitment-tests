//
//  CommercialOfferViewModel.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import Foundation

struct CommercialOfferViewModel {
    
    private let serviceBasket : BasketsServiceProtocol
    private let service: BooksServiceProtocol
    private let coordinator: CommercialOfferCoordinator?

    init(service: BooksServiceProtocol = ManagerBooksService(),serviceBasket: BasketsServiceProtocol = ManagerBaskets.shared,coordinator: CommercialOfferCoordinator){
        self.serviceBasket = serviceBasket
        self.coordinator = coordinator
        self.service = service
    }
 
    func fetchAllBooks(completion: @escaping ([(BookViewModel,Int)]) -> Void) {
        var data: [(BookViewModel,Int)] = []
        let books = serviceBasket.fetchAllBooks().reduce(into: [:]) { $0[$1, default: 0] += 1 }
        books.forEach { (book,count) in
            data.append((BookViewModel(book: book),count))
        }
        completion(data)
    }
    
    
 
    func removeBooks(bookModel: (BookViewModel,Int)){
        serviceBasket.removeBook(book: bookModel.0.book)
    }
    
    private func totalPricesInt() -> Double {
        Double(serviceBasket.fetchAllBooks().map( { $0.price ?? 0 }).reduce(0, +))
    }
  
    func totalPrices() -> String{
        return "\(totalPricesInt()) €"
    }
    
    func totalPricesOffers(completion: @escaping (String) -> Void){
        service.fetchOffers(basket: serviceBasket.fetchAllBooks()) { response in
            var discount: [Double] = []
            for i in 0...((response?.offers.count ?? 1) - 1) {
                if let offer = response?.offers[i] {
                    if offer.type == "minus" {
                        if let value = offer.value {
                            let minus = Double(totalPricesInt() - value)
                            if minus != 0 {
                                discount.append(minus)
                            }
                        }
                    } else if offer.type == "percentage" {
                        if let value = offer.value {
                            let percentage = totalPricesInt() - Double((value * totalPricesInt()) / 100)
                            if percentage != 0 {
                                discount.append(percentage)
                            }
                        }
                    } else {
                        if let sliceValue = offer.sliceValue, let value = offer.value {
                            let nbTranche = Int(totalPricesInt()) / sliceValue
                            let slice = Double(totalPricesInt() - (Double(nbTranche) * value))
                            if slice != 0 {
                                discount.append(slice)
                            }
                        }
                    }
                }
            }
            if let bestDiscount = discount.min() {
                completion("\(bestDiscount) €")
            }
        }
    }
    
    
    func viewDidDisapper(){
        coordinator?.viewDidDisapper()
    }
    
    func backToMainView(){
        coordinator?.backToParentView()
    }
}
