//
//  ReusableUIView.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

import UIKit

class ReusableUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.internalInit()
    }
    
    required init() {
        super.init(frame: CGRect.zero)
        self.internalInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.internalInit()
    }
    
    private func internalInit() {
        self.styleUI()
        self.setupUI()
        self.makeConstraints()
        self.configUI()
    }
    
    func styleUI() {} // Setting up view specific properties
    func makeConstraints() {} // Define auto-layout constraints
    func setupUI() {} // Add views to superView
    func configUI() {} // Config UI with Specific properties
    
    
    // ================
    // MARK: Equipments
    // ================
    public struct Equipments: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        public static let disableUserInteraction = Equipments(rawValue: 1 << 0)
        public static let activityIndicator = Equipments(rawValue: 1 << 2)
    }

    private var equipments: Equipments = []

    func equip(with newEquipements: Equipments) {
        if newEquipements.contains(.disableUserInteraction) {
            disableUserInteraction()
        } else {
            enableUserInteraction()
        }
        if newEquipements.contains(.activityIndicator) {
            addActivityIndicator()
        } else {
            removeActivityIndicator()
        }
    }

    func unEquip() {
        equip(with: [])
    }
    
    // User Interaction
    // ----------------
    private func disableUserInteraction() {
        guard !equipments.contains(.disableUserInteraction) else {
            return
        }
        equipments.update(with: .disableUserInteraction)

        isUserInteractionEnabled = false
    }

    private func enableUserInteraction() {
        guard equipments.contains(.disableUserInteraction) else {
            return
        }
        equipments.remove(.disableUserInteraction)

        isUserInteractionEnabled = true
    }


    // Activity Indicator
    // ------------------
    private static let activityIndicatorColor: UIColor = .orange
    private var activityIndicator: UIActivityIndicatorView?

    private func addActivityIndicator() {
        guard self.activityIndicator == nil else {
            return
        }
        equipments.update(with: .activityIndicator)

        let activityIndicator = createActivityIndicator()
        self.activityIndicator = activityIndicator
        addSubview(activityIndicator)
        startActivityIndicator()
    }

    private func removeActivityIndicator() {
        guard let activityIndicator = activityIndicator else {
            return
        }
        equipments.remove(.activityIndicator)

        activityIndicator.removeFromSuperview()
        self.activityIndicator = nil
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        // The large indicator seems to be shifted left and up.
        let result = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        if #available(iOS 13.0, *) {
            result.style = .large
        } else {
            result.style = .whiteLarge
        }
        result.backgroundColor = .corporateBlack
        result.color = ReusableUIView.activityIndicatorColor
        result.layer.cornerRadius = 20
        result.center = convert(center, from: superview)
        return result
    }

    private func startActivityIndicator() {
        guard let activityIndicator = activityIndicator else {
            return
        }
        activityIndicator.startAnimating()
        activityIndicator.layer.opacity = 0
        UIView.animate(withDuration: 0.2) {
            activityIndicator.layer.opacity = 0.7
        }
    }

}
