//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

enum CathayHomeTab: Int, CaseIterable {
    case cashbalance = 0
    case bottonView
    case myFavorite
    case ad
    
    static var count: Int {
        return self.allCases.count
    }
}

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
        button.setImage(image, for: .normal)
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
        view.backgroundColor = .white
        view.addBottomBarStyle()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bottomBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // constraint Spacing
    private let userImageViewSize: CGFloat = 40
    private let btnSize: CGFloat = 24
    
    //MARK: - setup UI
    private func setupViews() {
        let viewsToAdd: [UIView] = [
            userImageView,
            notificationBtn,
            tableView,
            bottomBarView,
        ]
        viewsToAdd.forEach { view.addSubview($0) }
        
        // setup TabBar View
        bottomBarView.addBottomBarStyle()
        bottomBarView.addSubview(bottomBarStackView)
        let home = createView(image: "HomeActive",
                              title: "Home",
                              tapAction: #selector(showHomeTab))
        let account = createView(image: "AccountDefault",
                                 title: "Account",
                                 tapAction: #selector(showAccountTab))
        let location = createView(image: "LocationActive",
                                  title: "Location",
                                  tapAction: #selector(showLocationTab))
        let service = createView(image: "Service",
                                 title: "Service",
                                 tapAction:  #selector(showServiceTab))
        let viewsToAddBottomBarStack: [UIView] = [
            home,
            account,
            location,
            service,
        ]
        viewsToAddBottomBarStack.forEach { bottomBarStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraint() {
        let topSafeArea = view.safeAreaLayoutGuide.topAnchor
        let rightSafeArea = view.safeAreaLayoutGuide.rightAnchor
        let leftSafeArea = view.safeAreaLayoutGuide.leftAnchor
        let bottomSafeArea = view.safeAreaLayoutGuide.bottomAnchor
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topSafeArea, constant: 5),
            userImageView.leftAnchor.constraint(equalTo: leftSafeArea, constant: 24),
            userImageView.heightAnchor.constraint(equalToConstant: userImageViewSize),
            userImageView.widthAnchor.constraint(equalToConstant: userImageViewSize),
            
            notificationBtn.rightAnchor.constraint(equalTo: rightSafeArea, constant: -24),
            notificationBtn.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            notificationBtn.heightAnchor.constraint(equalToConstant: btnSize),
            notificationBtn.widthAnchor.constraint(equalToConstant: btnSize),
            
            tableView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5),
            tableView.leftAnchor.constraint(equalTo: leftSafeArea),
            tableView.rightAnchor.constraint(equalTo: rightSafeArea),
            tableView.bottomAnchor.constraint(equalTo: bottomSafeArea),
            
            bottomBarView.leftAnchor.constraint(equalTo: leftSafeArea, constant: 24),
            bottomBarView.rightAnchor.constraint(equalTo: rightSafeArea, constant: -24),
            bottomBarView.bottomAnchor.constraint(equalTo: bottomSafeArea, constant: -22),
            bottomBarView.heightAnchor.constraint(equalToConstant: 50),
            
            bottomBarStackView.topAnchor.constraint(equalTo: bottomBarView.topAnchor),
            bottomBarStackView.leftAnchor.constraint(equalTo: bottomBarView.leftAnchor),
            bottomBarStackView.rightAnchor.constraint(equalTo: bottomBarView.rightAnchor),
            bottomBarStackView.bottomAnchor.constraint(equalTo: bottomBarView.bottomAnchor),
        ])
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        let useCells = [CashbalanceTableViewCell.self]
        useCells.forEach {
            tableView.register($0.self, forCellReuseIdentifier: $0.storyboardIdentifier)
        }
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
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setUpTableView()
        setupConstraint()
    }

}

//MARK: - TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return CathayHomeTab.count
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tab = CathayHomeTab(rawValue: indexPath.row) else {
            return UITableViewCell()
        }

        switch tab {
        case .cashbalance:
            return cashbalanceCell(on: tableView, at: indexPath)
        default:
            break
        }

        return UITableViewCell()
    }

    private func cashbalanceCell(on tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CashbalanceTableViewCell.self), for: indexPath) as! CashbalanceTableViewCell
        
        cell.configure()
        
        return cell
    }
}

