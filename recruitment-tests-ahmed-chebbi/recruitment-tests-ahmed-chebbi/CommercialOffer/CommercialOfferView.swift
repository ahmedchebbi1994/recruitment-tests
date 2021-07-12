//
//  CommercialOfferView.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 12/07/2021.
//

import UIKit
 
final class CommercialOfferView: ReusableUIView {
    
    // MARK: - IOutlet
    static let heightView: CGFloat = 50.0
    static let padding: CGFloat = 15.0
    static let cornerRadiusSubView: CGFloat = 10.0

    // MARK: - IBOutlet
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private(set) lazy var offerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: Self.heightView).isActive = true
        return view
    }()
    
    private(set) lazy var totalTxt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .corporateDarkBlue
        label.numberOfLines = 0
        label.text = "Totals:"
        return label
    }()
    
    private(set) lazy var priceDiscountTxt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .red
        label.numberOfLines = 0
        label.text = "15 €"
        return label
    }()
    private(set) lazy var priceTxt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .corporateBlack
        label.numberOfLines = 0
        label.text = "15 €"
        return label
    }()
    
    
    // MARK: - Install UI
    override func setupUI() {
        addSubview(tableView)
        
        offerView.addSubview(priceDiscountTxt)
        offerView.addSubview(priceTxt)

        offerView.addSubview(totalTxt)
        addSubview(offerView)
    }
    
    // MARK: - Constraints
    override func makeConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: offerView.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            offerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,constant: -Self.padding),
            offerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: Self.padding),
            offerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -Self.padding),
            
            priceDiscountTxt.trailingAnchor.constraint(equalTo: offerView.trailingAnchor,constant: -Self.padding),
            priceDiscountTxt.topAnchor.constraint(equalTo: offerView.topAnchor),
            priceDiscountTxt.bottomAnchor.constraint(equalTo: offerView.bottomAnchor),
            
            priceTxt.trailingAnchor.constraint(equalTo: priceDiscountTxt.leadingAnchor,constant: -Self.padding),
            priceTxt.topAnchor.constraint(equalTo: offerView.topAnchor),
            priceTxt.bottomAnchor.constraint(equalTo: offerView.bottomAnchor),
            
            
            totalTxt.leadingAnchor.constraint(equalTo: offerView.leadingAnchor,constant: Self.padding),
            totalTxt.topAnchor.constraint(equalTo: offerView.topAnchor),
            totalTxt.bottomAnchor.constraint(equalTo: offerView.bottomAnchor),
        ])
    }
    
    // MARK: - configUI
    override func configUI() {
        tableView.showsVerticalScrollIndicator = false
        // register a defalut cell
        tableView.register(BookCell.self, forCellReuseIdentifier: BookCell.identifier)
        
        offerView.layer.cornerRadius = Self.cornerRadiusSubView

    }
    
    // MARK: - Styling
    override func styleUI() {
        tableView.backgroundColor = .corporateWhite
        backgroundColor = .corporateWhite
        offerView.layer.shadowColor = UIColor.corporateLightGray.cgColor
        offerView.layer.shadowOpacity = 0.5
        offerView.layer.shadowOffset = CGSize.zero
        offerView.layer.shadowRadius = 1
        offerView.backgroundColor = .corporateLightGray
    }
}
