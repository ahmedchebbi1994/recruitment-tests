//
//  CommercialOfferViewController.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import UIKit

class CommercialOfferViewController: BindableViewController<CommercialOfferView, CommercialOfferViewModel> {
   
    //MARK: -Property
    var dataResources: [(BookViewModel,Int)] = []
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  .corporateWhite
        // Get data 
        loadData()
    }
    
 
    func bindViewModel() {
        layout.tableView.delegate = self
        layout.tableView.dataSource = self
        title = "Baskets"
    }
    
    private func loadData(){
        layout.equip(with: [.disableUserInteraction,.activityIndicator])
        viewModel.fetchAllBooks { (data) in
            self.dataResources = data
            self.reloadTableView()
        }
    }
    
    private func reloadTableView(){
        self.layout.unEquip()
        self.layout.tableView.reloadData()
    }
    
}
extension CommercialOfferViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataResources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mycell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as? BookCell {
            let viewModel = dataResources[indexPath.row]
            mycell.addButton.isHidden = true
            mycell.numberItemTxt.isHidden = false
            mycell.bind(to: viewModel.0, countItem: viewModel.1)
            return mycell
        }
        return UITableViewCell()
    }
    
}
