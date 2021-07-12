//
//  DetailsBookCoordinator.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import UIKit

final class DetailsBookCoordinator: Coordinator {

    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: BooksListCoordinator?

    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // Nothing to do here
    }
    
    func start(viewModel: BookViewModel) {
        let detailsBookViewModel = DetailsBookViewModel(viewModel: viewModel, coordinator: self)
        var detailsBookViewController = DetailsBookViewController()
        detailsBookViewController.bind(toViewModel: detailsBookViewModel)
        navigationController.pushViewController(detailsBookViewController, animated: true)
    }
 
    func childDidFinish(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {
              coordinator === $0
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func viewDidDisapper(){
        parentCoordinator?.childDidFinish(self)
    }
    
}
