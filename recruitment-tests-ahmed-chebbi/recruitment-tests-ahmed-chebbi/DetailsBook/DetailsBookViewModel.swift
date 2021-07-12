//
//  DetailsBookViewModel.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

struct DetailsBookViewModel {
    
    var coordinator: DetailsBookCoordinator?
    var bookViewModel: BookViewModel
    
    init(viewModel: BookViewModel,coordinator: DetailsBookCoordinator) {
        self.bookViewModel = viewModel
        self.coordinator = coordinator
    }
    
    func displaySynopsis() -> [String]{
        bookViewModel.book.synopsis ?? []
    }
    
    func viewDidDisapper(){
        coordinator?.viewDidDisapper()
    }
}
