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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let favoriteTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
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
            favoriteImageView.topAnchor.constraint(equalTo: topContentViewAnchor),
            favoriteImageView.leftAnchor.constraint(equalTo: leftContentViewAnchor),
            favoriteImageView.rightAnchor.constraint(equalTo: rightContentViewAnchor),
            favoriteImageView.centerXAnchor.constraint(equalTo: favoriteTitleLabel.centerXAnchor),
            
            favoriteTitleLabel.topAnchor.constraint(equalTo: favoriteImageView.bottomAnchor),
            favoriteTitleLabel.leftAnchor.constraint(equalTo: favoriteImageView.leftAnchor),
            favoriteTitleLabel.rightAnchor.constraint(equalTo: favoriteImageView.rightAnchor),
            favoriteTitleLabel.bottomAnchor.constraint(equalTo: bottomContentViewAnchor, constant: -2),
        ])
    }
    
    func configure(title: String) {
        //TODO: zeplin 上只有四張圖片，暫時以這四張隨機給值
        let testImage = ["CredirCard", "CUBC", "Mobile", "PMF"]
        let randomIndex = Int(arc4random_uniform(UInt32(testImage.count)))
        let imageName = testImage[randomIndex]
        
        favoriteImageView.image = UIImage(named: imageName)
        favoriteTitleLabel.text = title
    }
}

