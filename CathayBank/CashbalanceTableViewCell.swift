//
//  CashbalanceTableViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

class CashbalanceTableViewCell: UITableViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
    }
    
    //MARK: - UI
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Account Balance"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let eyeBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "iconEye01On")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Parameters ....
    
    //MARK: - setup
    private func setupViews() {
        
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            // 由左上到右下，依照UI來設計
        ])
    }
    
    func configure() {
        //...
    }

}
