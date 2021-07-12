//
//  CommercialOfferCoordinator.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import UIKit

final class CommercialOfferCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: BooksListCoordinator?

    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = false
    }
    
    func start() {
        let commercialOfferViewModel = CommercialOfferViewModel(coordinator: self)
        var commercialOfferViewController = CommercialOfferViewController()
        commercialOfferViewController.bind(toViewModel: commercialOfferViewModel)
        navigationController.pushViewController(commercialOfferViewController, animated: true)
    }
 
    func childDidFinish(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {
              coordinator === $0
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
