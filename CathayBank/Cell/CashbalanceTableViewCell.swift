//
//  CashbalanceTableViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

class CashbalanceTableViewCell: UITableViewCell {
    private var isShowAmount: Bool
    private var isFirstLogin: Bool
    private var viewModel: AmountViewModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.isShowAmount = true
        self.isFirstLogin = true
        self.viewModel = AmountViewModel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
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
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let usdTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textColor = .charcoalGray
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usdSubTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .dimGray
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let khrTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "KHR"
        label.textColor = .charcoalGray
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let khrSubTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .dimGray
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - setup
    private func setupViews() {
        let viewsToAdd: [UIView] = [
            titleLabel,
            eyeBtn,
            usdTitleLabel,
            usdSubTitleLabel,
            khrTitleLabel,
            khrSubTitleLabel,
        ]
        viewsToAdd.forEach { self.contentView.addSubview($0) }
        eyeBtn.addTarget(self, action: #selector(eyeAmountAction), for: .touchUpInside)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            
            eyeBtn.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 8),
            eyeBtn.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            eyeBtn.heightAnchor.constraint(equalToConstant: 24),
            eyeBtn.widthAnchor.constraint(equalToConstant: 24),
            
            usdTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            usdTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            
            usdSubTitleLabel.topAnchor.constraint(equalTo: usdTitleLabel.bottomAnchor),
            usdSubTitleLabel.leftAnchor.constraint(equalTo: usdTitleLabel.leftAnchor),
            usdSubTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            
            khrTitleLabel.topAnchor.constraint(equalTo: usdSubTitleLabel.bottomAnchor, constant: 8),
            khrTitleLabel.leftAnchor.constraint(equalTo: usdSubTitleLabel.leftAnchor),
            
            khrSubTitleLabel.topAnchor.constraint(equalTo: khrTitleLabel.bottomAnchor),
            khrSubTitleLabel.leftAnchor.constraint(equalTo: khrTitleLabel.leftAnchor),
            khrSubTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            khrSubTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    @objc func eyeAmountAction() {
        if isShowAmount {
            let image = UIImage(named: "iconEye01On")
            eyeBtn.setImage(image, for: .normal)
            isShowAmount = false
            
            usdSubTitleLabel.attributedText = NSAttributedString(string: "********")
            khrSubTitleLabel.attributedText = NSAttributedString(string: "********")
        } else {
            let image = UIImage(named: "iconEye02Off")
            eyeBtn.setImage(image, for: .normal)
            isShowAmount = true
            
            if isFirstLogin {
                configure(isFirstLogin: true)
            } else {
                configure(isFirstLogin: false)
            }
        }
    }
    
    func configure(isFirstLogin: Bool) {
        //TODO: Add loading
        usdSubTitleLabel.text = "Loading..."
        khrSubTitleLabel.text = "Loading..."
        
        self.isFirstLogin = isFirstLogin
        
        if isFirstLogin {
            viewModel.getFirstUSDTotal { usdTotal in
                self.usdSubTitleLabel.text = usdTotal
            }
            
            viewModel.getFirstKHRTotal { khrTotal in
                self.khrSubTitleLabel.text = khrTotal
            }
        } else {
            viewModel.getRefreshUSDTotal { usdTotal in
                self.usdSubTitleLabel.text = usdTotal
            }
            
            viewModel.getRefreshKHRTotal { khrTotal in
                self.khrSubTitleLabel.text = khrTotal
            }
        }
    }
}
