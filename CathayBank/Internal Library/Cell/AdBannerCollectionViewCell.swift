//
//  AdBannerCollectionViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/6.
//

import UIKit

class AdBannerCollectionViewCell: UICollectionViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraint()
    }
    
    //MARK: - UI
    private let adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - setup
    private func setupViews() {
        contentView.addSubview(adImageView)
    }
    
    private func setupConstraint() {
        let topContentViewAnchor = contentView.topAnchor
        let leftContentViewAnchor = contentView.leftAnchor
        let rightContentViewAnchor = contentView.rightAnchor
        let bottomContentViewAnchor = contentView.bottomAnchor
        
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: topContentViewAnchor),
            adImageView.leftAnchor.constraint(equalTo: leftContentViewAnchor),
            adImageView.rightAnchor.constraint(equalTo: rightContentViewAnchor),
            adImageView.bottomAnchor.constraint(equalTo: bottomContentViewAnchor),
        ])
    }
    
    func configure(image: String) {
        adImageView.loadUrlImage(urlString: image) { result in
            switch result {
            case .success(let image):
                if let image = image {
                    self.adImageView.image = image
                } else {
                    let defaultImage = UIImage(named: "welcome_ad_default") ?? UIImage()
                    self.adImageView.image = defaultImage
                }
            case .failure(_):
                let defaultImage = UIImage(named: "welcome_ad_default") ?? UIImage()
                self.adImageView.image = defaultImage
            }
        }
    }
}
