//
//  BookCell.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import UIKit

final class BookCell: UITableViewCell {
    
    static let padding: CGFloat = 5.0
    
    static let heightCell: CGFloat = 200.0
    
    //SUB View
    static let topPaddingSubView: CGFloat = 40.0
    static let cornerRadiusSubView: CGFloat = 10.0
    
    //StackView
    static let spacingMainStackView: CGFloat = 10.0
      //Image Width
    static let multiplerWidth: CGFloat = 0.3
    static let paddingImage: CGFloat = 15.0

    // MARK: - Property
    static let identifier = "BookCell"
    
    // MARK: - IOutlet
    private(set) lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: Self.heightCell).isActive = true
        return view
    }()
    
    private(set) lazy var subMainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private(set) lazy var viewImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private(set) lazy var imageBookView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    
    private(set) lazy var viewDescription: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private(set) lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Self.spacingMainStackView
        return stackView
    }()
    private(set) lazy var titleTxt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .corporateBlack
        label.numberOfLines = 0
        return label
    }()
    private(set) lazy var synopsisCountTxt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .corporateGolden
        label.numberOfLines = 0
        return label
    }()
    private(set) lazy var bottomViewDescription: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private(set) lazy var priceTxt: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .corporateDarkBlue
        label.numberOfLines = 0
        return label
    }()
    private(set) lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.corporateDarkBlue, for: .normal)
        button.setTitleColor(.corporateBlack, for: .highlighted)
        button.setTitle("Buy now", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.corporateDarkBlue.cgColor
        button.layer.cornerRadius = 10.0
        button.titleEdgeInsets = UIEdgeInsets(top: 0,left: 5,bottom: 0,right: 5)
        return button
    }()
    private(set) lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Self.spacingMainStackView
        return stackView
    }()
    
    
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        makeConstraints()
        configUI()
        styleUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install UI
    func setupUI() {
        bottomViewDescription.addSubview(priceTxt)
        bottomViewDescription.addSubview(addButton)
        
        descriptionStackView.addArrangedSubview(titleTxt)
        descriptionStackView.addArrangedSubview(synopsisCountTxt)
        descriptionStackView.addArrangedSubview(bottomViewDescription)
        
        viewImage.addSubview(imageBookView)
        viewDescription.addSubview(descriptionStackView)
        
        mainStackView.addArrangedSubview(viewImage)
        mainStackView.addArrangedSubview(viewDescription)
        
        subMainView.addSubview(mainStackView)
        
        mainView.addSubview(subMainView)
        
        contentView.addSubview(mainView)
    }
    
    // MARK: - Constraints
    func makeConstraints() {
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: Self.padding),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Self.padding),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Self.padding),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -Self.padding),
            
            subMainView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: Self.topPaddingSubView),
            subMainView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            subMainView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            subMainView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: subMainView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: subMainView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: subMainView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: subMainView.bottomAnchor),
            
            viewImage.widthAnchor.constraint(equalTo: subMainView.widthAnchor, multiplier: Self.multiplerWidth),
            
            imageBookView.topAnchor.constraint(equalTo: viewImage.topAnchor,constant: -Self.paddingImage),
            imageBookView.leadingAnchor.constraint(equalTo: viewImage.leadingAnchor),
            imageBookView.trailingAnchor.constraint(equalTo: viewImage.trailingAnchor),
            imageBookView.bottomAnchor.constraint(equalTo: viewImage.bottomAnchor,constant: -Self.paddingImage),
            
            descriptionStackView.topAnchor.constraint(equalTo: viewDescription.topAnchor,constant: Self.padding),
            descriptionStackView.leadingAnchor.constraint(equalTo: viewDescription.leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: viewDescription.trailingAnchor),
            descriptionStackView.bottomAnchor.constraint(equalTo: viewDescription.bottomAnchor,constant: -Self.paddingImage),
            
            priceTxt.topAnchor.constraint(equalTo: bottomViewDescription.topAnchor),
            priceTxt.bottomAnchor.constraint(equalTo: bottomViewDescription.bottomAnchor),
            priceTxt.leadingAnchor.constraint(equalTo: bottomViewDescription.leadingAnchor),

            
            addButton.topAnchor.constraint(equalTo: bottomViewDescription.topAnchor),
            addButton.bottomAnchor.constraint(equalTo: bottomViewDescription.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: bottomViewDescription.trailingAnchor,constant: -30.0),
            addButton.widthAnchor.constraint(equalToConstant: 100.0)

        ])
    }
    
    
    // MARK: - configUI
    func configUI() {
        mainView.backgroundColor = .corporateWhite
        
        subMainView.layer.cornerRadius = Self.cornerRadiusSubView
        subMainView.backgroundColor = .corporateLightGray
        
        imageBookView.layer.cornerRadius = Self.cornerRadiusSubView
        selectionStyle = .none
    }
    
    // MARK: - Styling
    func styleUI() {
        backgroundColor = .corporateWhite
        subMainView.layer.shadowColor = UIColor.corporateLightGray.cgColor
        subMainView.layer.shadowOpacity = 0.5
        subMainView.layer.shadowOffset = CGSize.zero
        subMainView.layer.shadowRadius = 1
        
        imageBookView.layer.shadowColor = UIColor.corporateLightGray.cgColor
        imageBookView.layer.shadowOpacity = 0.5
        imageBookView.layer.shadowOffset = CGSize.zero
        imageBookView.layer.shadowRadius = 1
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.image = nil
        self.priceTxt.text = nil
        self.titleTxt.text = nil
    }
 
    
    // MARK: - Bind ViewModel
    func bind(to viewModel: BookViewModel){
        self.titleTxt.text = viewModel.displayTitle
        self.priceTxt.text = viewModel.displayPrice
        self.synopsisCountTxt.text = viewModel.displaySynopsisCount
        if let url = URL(string: viewModel.displayCoverUrl) {
            LoaderImage.downloadImage(url: url) { (image, err) in
                if err == nil {
                    if let image = image {
                        DispatchQueue.main.async {
                            self.imageBookView.image = image
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.imageBookView.image = UIImage(named: "defaultImage")
                    }
                }
            }
        } else {
            self.imageBookView.image = UIImage(named: "defaultImage")
        }
    }
    
}
