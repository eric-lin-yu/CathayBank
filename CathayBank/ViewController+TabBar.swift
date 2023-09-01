//
//  ViewController+TabBar.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/1.
//

import Foundation
import UIKit

extension ViewController {
    func setupTabBarView(bottomBarView: UIView, bottomBarStackView: UIStackView) {
        bottomBarView.addBottomBarStyle()
        bottomBarView.addSubview(bottomBarStackView)
        
        let home = createView(image: "HomeActive", title: "Home", tapAction: #selector(showHomeTab))
        let account = createView(image: "AccountDefault", title: "Account", tapAction: #selector(showAccountTab))
        let location = createView(image: "LocationActive", title: "Location", tapAction: #selector(showLocationTab))
        let service = createView(image: "Service", title: "Service", tapAction: #selector(showServiceTab))
        
        let viewsToAddBottomBarStack: [UIView] = [home, account, location, service]
        viewsToAddBottomBarStack.forEach { bottomBarStackView.addArrangedSubview($0) }
    }
    
    /// Create a custom tab bar item view.
    /// - Parameters:
    ///   - image: The name of the image for the icon.
    ///   - title: The title text for the item.
    ///   - tapAction: The selector to be called when the item is tapped.
    /// - Returns: A custom view representing a tab bar item.
    private func createView(image: String, title: String, tapAction: Selector) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(imageView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: tapAction)
        containerView.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
        ])
        return containerView
    }
    
    @objc private func showHomeTab() {
        print("showHome")
    }
    
    @objc private func showAccountTab() {
        print("showAccount")
    }
    
    @objc private func showLocationTab() {
        print("showLocation")
    }
    
    @objc private func showServiceTab() {
        print("showService")
    }
}
