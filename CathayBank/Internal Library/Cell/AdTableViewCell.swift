//
//  AdTableViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // tableView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
    }
    
    private let adView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        //..
    }
}
