//
//  BooksListViewController.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import UIKit


final class BooksListViewController: BindableViewController<BooksListView, BooksListViewModel> {
    
    //MARK: -Property
    var dataResources: [BookViewModel] = []
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  .corporateWhite
        
        //Setup Button bar item
        let books = UIBarButtonItem(title: "Basket", style: .done, target: self, action: #selector(displayAllBasket))
        navigationItem.rightBarButtonItems = [books]
        
        //Setup Observer for add book to basket
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.refreshBasketCount),
            name: NSNotification.Name("BookAdded"),
            object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
        viewModel.updatePrefersLargeTitle(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshBasketCount()
    }
    
    func bindViewModel() {
        layout.tableView.delegate = self
        layout.tableView.dataSource = self
        title = "Books"
    }
    
    private func loadData(){
        layout.equip(with: [.disableUserInteraction,.activityIndicator])
        viewModel.fetchAllBooks { (data) in
            self.dataResources = data
            self.reloadTableView()
        }
    }
    
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.layout.unEquip()
            self.layout.tableView.reloadData()
        }
    }
    @objc func refreshBasketCount() {
        let books = UIBarButtonItem(title: "\(viewModel.countBooksInBaskets())", style: .done, target: self, action: #selector(displayAllBasket))
        navigationItem.rightBarButtonItems = [books]
    }
    @objc func displayAllBasket() {
        viewModel.showBaskets()
    }
    
}
extension BooksListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataResources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mycell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as? BookCell {
            let viewModel = dataResources[indexPath.row]
            mycell.bind(to: viewModel)
            return mycell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetailsBook(viewModel: dataResources[indexPath.row])
    }
    
    
    
}
