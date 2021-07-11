//
//  AppCoordinator.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let navigationController = UINavigationController()
        let booksListCoordinator = BooksListCoordinator(navigationController: navigationController)
        childCoordinators.append(booksListCoordinator)
        booksListCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
