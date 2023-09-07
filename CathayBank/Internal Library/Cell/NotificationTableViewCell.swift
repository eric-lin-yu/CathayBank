//
//  NotificationTableViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/7.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    // Parameters ....
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // tableView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
    }
    
    //MARK: - UI
    private let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .steelGray
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - setup
    private func setupViews() {
        let viewsToAdd: [UIView] = [
            statusImageView,
            titleLabel,
            timeLabel,
            contentLabel,
        ]
        viewsToAdd.forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraint() {
        let topContentViewAnchor = contentView.topAnchor
        let leftContentViewAnchor = contentView.leftAnchor
        let rightContentViewAnchor = contentView.rightAnchor
        let bottomContentViewAnchor = contentView.bottomAnchor
        
        NSLayoutConstraint.activate([
            statusImageView.topAnchor.constraint(equalTo: topContentViewAnchor, constant: 22),
            statusImageView.leftAnchor.constraint(equalTo: leftContentViewAnchor, constant: 16),
            statusImageView.heightAnchor.constraint(equalToConstant: 12),
            statusImageView.widthAnchor.constraint(equalToConstant: 12),
            
            titleLabel.leftAnchor.constraint(equalTo: statusImageView.rightAnchor, constant: 4),
            titleLabel.rightAnchor.constraint(equalTo: rightContentViewAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: statusImageView.centerYAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            timeLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            timeLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            contentLabel.leftAnchor.constraint(equalTo: timeLabel.leftAnchor),
            contentLabel.rightAnchor.constraint(equalTo: rightContentViewAnchor, constant: -32),
            contentLabel.bottomAnchor.constraint(equalTo: bottomContentViewAnchor, constant: -16),
        ])
    }
    
    func configure(notificationArray: NotificationModel) {
        statusImageView.isHidden = notificationArray.status
        titleLabel.text = notificationArray.title
        timeLabel.text = notificationArray.updateDateTime
        contentLabel.text = notificationArray.message
    }

}
