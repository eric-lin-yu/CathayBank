//
//  FavoriteTableViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/1.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    // Parameters ....
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
    }
    
    //MARK: - UI
    //TODO: buttonView 想一下可擴增的架構
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Favorite"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //TODO: collectionView 
    
    //MARK: - setup
    private func setupViews() {
        let viewsToAdd: [UIView] = [
            //..
        ]
        viewsToAdd.forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraint() {
        let topContentViewAnchor = contentView.topAnchor
        let leftContentViewAnchor = contentView.leftAnchor
        let rightContentViewAnchor = contentView.rightAnchor
        let bottomContentViewAnchor = contentView.bottomAnchor
        NSLayoutConstraint.activate([
            // 由左上到右下，依照UI來設計
        ])
    }
    
    func configure() {
        //...
    }

}
