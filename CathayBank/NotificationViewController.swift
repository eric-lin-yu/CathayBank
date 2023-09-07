//
//  NotificationViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/7.
//

import UIKit

class NotificationViewController: UIViewController {
    private var notificationArray: [NotificationModel]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(notificationArray: [NotificationModel]) {
        self.notificationArray = notificationArray
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - setup
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupConstraint() {
        let topSafeArea = view.safeAreaLayoutGuide.topAnchor
        let leftSafeArea = view.safeAreaLayoutGuide.leftAnchor
        let rightSafeArea = view.safeAreaLayoutGuide.rightAnchor
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topSafeArea),
            tableView.leftAnchor.constraint(equalTo: leftSafeArea),
            tableView.rightAnchor.constraint(equalTo: rightSafeArea),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        let useCells = [NotificationTableViewCell.self]
        useCells.forEach {
            tableView.register($0.self, forCellReuseIdentifier: $0.storyboardIdentifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraint()
        setUpTableView()
        
        navigationItem.title = "Notification"
    }
}

//MARK: - TableView
extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NotificationTableViewCell.self), for: indexPath) as! NotificationTableViewCell
        
        cell.configure(notificationArray: notificationArray[indexPath.row])
        
        return cell
    }
}
