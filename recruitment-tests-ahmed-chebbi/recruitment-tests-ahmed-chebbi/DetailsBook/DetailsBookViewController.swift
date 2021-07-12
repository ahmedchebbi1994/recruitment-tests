//
//  DetailsBookViewController.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import UIKit

class DetailsBookViewController: BindableViewController<DetailsBookView, DetailsBookViewModel> {
   
    //MARK: -Property
    var dataResources: [String] = []
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  .corporateWhite
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisapper()
    }
 
    func bindViewModel() {
        layout.tableView.delegate = self
        layout.tableView.dataSource = self
        dataResources = viewModel.displaySynopsis()
        layout.tableView.reloadData()
    }
 
}
extension DetailsBookViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataResources.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let mycell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as? BookCell {
                let viewModel = viewModel.bookViewModel
                mycell.bind(to: viewModel)
                return mycell
            }
        }
        let mycell = tableView.dequeueReusableCell(withIdentifier: DetailsBookView.identifier, for: indexPath)
        mycell.textLabel?.numberOfLines = 0
        mycell.textLabel?.text = dataResources[indexPath.row-1]
        return mycell
    }
    

}
