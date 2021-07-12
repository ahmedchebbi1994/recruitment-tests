//
//  BooksListCoordinator.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import UIKit

final class BooksListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func updatePrefersLargeTitle(_ isTrue: Bool) {
        self.navigationController.navigationBar.prefersLargeTitles = isTrue
    }
    
    func start() {
        let booksListViewModel = BooksListViewModel(coordinator: self)
        var booksListViewController = BooksListViewController()
        booksListViewController.bind(toViewModel: booksListViewModel)
        navigationController.setViewControllers([booksListViewController], animated: false)
    }
 
    func childDidFinish(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {
              coordinator === $0
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func showBaskets() {
        let commercialOfferCoordinator = CommercialOfferCoordinator(navigationController: navigationController)
        childCoordinators.append(commercialOfferCoordinator)
        commercialOfferCoordinator.parentCoordinator = self
        commercialOfferCoordinator.start()
    }
    
    func showDetailsBook(viewModel: BookViewModel){
        let detailsBookCoordinator = DetailsBookCoordinator(navigationController: navigationController)
        childCoordinators.append(detailsBookCoordinator)
        detailsBookCoordinator.parentCoordinator = self
        detailsBookCoordinator.start(viewModel: viewModel)
    }
}
