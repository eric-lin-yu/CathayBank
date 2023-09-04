//
//  FavoriteCollectionViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/4.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraint()
    }
    
    //MARK: - UI
    private let favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let favoriteTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - setup
    private func setupViews() {
        contentView.addSubview(favoriteImageView)
        contentView.addSubview(favoriteTitleLabel)
    }
    
    private func setupConstraint() {
        let topContentViewAnchor = contentView.topAnchor
        let leftContentViewAnchor = contentView.leftAnchor
        let rightContentViewAnchor = contentView.rightAnchor
        let bottomContentViewAnchor = contentView.bottomAnchor
        NSLayoutConstraint.activate([
            favoriteImageView.topAnchor.constraint(equalTo: topContentViewAnchor, constant: 2),
            favoriteImageView.leftAnchor.constraint(equalTo: leftContentViewAnchor, constant: 2),
            favoriteImageView.rightAnchor.constraint(equalTo: rightContentViewAnchor, constant: -2),
            
            favoriteTitleLabel.topAnchor.constraint(equalTo: favoriteImageView.bottomAnchor),
            favoriteTitleLabel.leftAnchor.constraint(equalTo: leftContentViewAnchor),
            favoriteTitleLabel.rightAnchor.constraint(equalTo: rightContentViewAnchor),
            favoriteTitleLabel.bottomAnchor.constraint(equalTo: bottomContentViewAnchor, constant: -2),
        ])
    }
    
    func configure(title: String) {
//        favoriteImageView.image = image
        favoriteTitleLabel.text = title
    }
}

