//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

enum CathayHomeTab: Int, CaseIterable {
    case cashbalance = 0
    case favorite
    case adBanner
    
    static var count: Int {
        return self.allCases.count
    }
}

class ViewController: UIViewController {
    private let refreshControl = UIRefreshControl()
    private var isFirstLogin: Bool = true
    // constraint Spacing
    private let xSpacing: CGFloat = 5
    private let ySpacing: CGFloat = 24
    private let userImageViewSize: CGFloat = 40
    private let btnSize: CGFloat = 24
    private let bottomSpacing: CGFloat = 22
    private let bottomViewHeight: CGFloat = 50
    
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

    //MARK: - setup UI
    private func setupViews() {
        view.backgroundColor = .white
        let viewsToAdd: [UIView] = [
            userImageView,
            notificationBtn,
            tableView,
            bottomBarView,
        ]
        viewsToAdd.forEach { view.addSubview($0) }
    }
    
    private func setupConstraint() {
        let topSafeArea = view.safeAreaLayoutGuide.topAnchor
        let rightSafeArea = view.safeAreaLayoutGuide.rightAnchor
        let leftSafeArea = view.safeAreaLayoutGuide.leftAnchor
        let bottomSafeArea = view.safeAreaLayoutGuide.bottomAnchor
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topSafeArea, constant: xSpacing),
            userImageView.leftAnchor.constraint(equalTo: leftSafeArea, constant: ySpacing),
            userImageView.heightAnchor.constraint(equalToConstant: userImageViewSize),
            userImageView.widthAnchor.constraint(equalToConstant: userImageViewSize),
            
            notificationBtn.rightAnchor.constraint(equalTo: rightSafeArea, constant: -ySpacing),
            notificationBtn.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            notificationBtn.heightAnchor.constraint(equalToConstant: btnSize),
            notificationBtn.widthAnchor.constraint(equalToConstant: btnSize),
            
            tableView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: xSpacing),
            tableView.leftAnchor.constraint(equalTo: leftSafeArea),
            tableView.rightAnchor.constraint(equalTo: rightSafeArea),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bottomBarView.leftAnchor.constraint(equalTo: leftSafeArea, constant: ySpacing),
            bottomBarView.rightAnchor.constraint(equalTo: rightSafeArea, constant: -ySpacing),
            bottomBarView.bottomAnchor.constraint(equalTo: bottomSafeArea, constant: -bottomSpacing),
            bottomBarView.heightAnchor.constraint(equalToConstant: bottomViewHeight),
            
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
        
        let useCells = [CashbalanceTableViewCell.self,
                        FavoriteTableViewCell.self,
                        AdBannerTableViewCell.self,
                       ]
        useCells.forEach {
            tableView.register($0.self, forCellReuseIdentifier: $0.storyboardIdentifier)
        }
    }
    
    //MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setUpTableView()
        setupTabBarView(bottomBarView: bottomBarView, bottomBarStackView: bottomBarStackView)
        setupConstraint()
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc private func refreshData(_ sender: Any) {
        isFirstLogin = false
        
        if !isFirstLogin {
            let image = UIImage(named: "iconBell02Active")
            notificationBtn.setImage(image, for: .normal)
            notificationBtn.addTarget(self, action: #selector(notificationAction), for: .touchUpInside)
        }
        
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc private func notificationAction() {
        NotificationViewModel.shared.configureData(isFirstLogin: isFirstLogin) { [weak self] result in
            guard let self = self else { return }
            
            let vc = NotificationViewController(notificationArray: result)
            
            DispatchQueue.main.async {
                self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(self.back))
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc private func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CathayHomeTab.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tab = CathayHomeTab(rawValue: indexPath.row) else {
            return UITableViewCell()
        }

        switch tab {
        case .cashbalance:
            return cashbalanceCell(on: tableView, at: indexPath)
        case .favorite:
            return favoriteTableViewCell(on: tableView, at: indexPath)
        case .adBanner:
            return adBannerTableViewCell(on: tableView, at: indexPath)
        }
    }

    private func cashbalanceCell(on tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CashbalanceTableViewCell.self), for: indexPath) as! CashbalanceTableViewCell
        
        AmountViewModel.shared.configureData(isFirstLogin: isFirstLogin) { usdTotal, khrTotal in
            cell.configure(usdTotal: usdTotal, khrTotal: khrTotal)
        }
        
        return cell
    }
    
    private func favoriteTableViewCell(on tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FavoriteTableViewCell.self), for: indexPath) as! FavoriteTableViewCell
        
        FavoriteViewModel.shared.configureData(isFirstLogin: isFirstLogin) { favoriteModels in
            cell.configure(isFirstLogin: self.isFirstLogin, favoriteArray: favoriteModels)
        }
        return cell
    }
    
    private func adBannerTableViewCell(on tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AdBannerTableViewCell.self), for: indexPath) as! AdBannerTableViewCell
        
        BannerViewModel.shared.configureData { bannerModels in
            cell.configure(bannerArray: bannerModels)
        }
        return cell
    }
}

