//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

class ViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - UI
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let notificationBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "iconBell01Nomal")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let bottomBarView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // constraint Spacing
    private let userImageViewSize: CGFloat = 40
    
    //MARK: - setup
    private func setupViews() {
        let viewsToAdd: [UIView] = [
            userImageView,
        ]
        viewsToAdd.forEach { view.addSubview($0) }
    }
    
    private func setupConstraint() {
        let topSafeArea = view.safeAreaLayoutGuide.topAnchor
        let rightSafeArea = view.safeAreaLayoutGuide.rightAnchor
        let leftSafeArea = view.safeAreaLayoutGuide.leftAnchor
        let bottomSafeArea = view.safeAreaLayoutGuide.bottomAnchor
        
        NSLayoutConstraint.activate([
            // 由上到下、由左到右設計
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraint()
    }


}

