//
//  AdTableViewCell.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

class AdBannerTableViewCell: UITableViewCell {
    private var viewModel: BannerViewModel
    private var adBannerArray: [BannerModel] = []
    private var timer: Timer?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // tableView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.viewModel = BannerViewModel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraint()
        setUpCollcetionView()
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    //MARK: - setup
    private func setupViews() {
        let viewsToAdd: [UIView] = [
            collectionView,
            pageControl,
        ]
        viewsToAdd.forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraint() {
        let topContentViewAnchor = contentView.topAnchor
        let leftContentViewAnchor = contentView.leftAnchor
        let rightContentViewAnchor = contentView.rightAnchor
        let bottomContentViewAnchor = contentView.bottomAnchor
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topContentViewAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftContentViewAnchor, constant: 24),
            collectionView.rightAnchor.constraint(equalTo: rightContentViewAnchor, constant: -24),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 4),
            pageControl.leftAnchor.constraint(equalTo: collectionView.leftAnchor),
            pageControl.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomContentViewAnchor, constant: -4),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setUpCollcetionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AdBannerCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AdBannerCollectionViewCell.self))
    }
    
    func configure(bannerArray: [BannerModel]) {
        self.adBannerArray = bannerArray
        collectionView.reloadData()
        
        if adBannerArray.isEmpty {
            startAutoScroll()
        } else {
            stopAutoScroll()
        }
    }
    
    // 自動輪播 ad View
    func startAutoScroll() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    
    func stopAutoScroll() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func scrollToNextPage() {
        let currentPage = pageControl.currentPage
        let nextPage = (currentPage + 1) % adBannerArray.count
        
        let nextIndexPath = IndexPath(item: nextPage, section: 0)
        collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
        
        pageControl.currentPage = nextPage
    }
}

//MARK: - CollectionView
extension AdBannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adBannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AdBannerCollectionViewCell.self), for: indexPath) as? AdBannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(image: adBannerArray[indexPath.row].linkUrl)
        pageControl.numberOfPages = adBannerArray.count
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width,
                      height: collectionView.bounds.height)
    }
}

//MARK: - UIScrollViewDelegate
extension AdBannerTableViewCell: UIScrollViewDelegate {
    // CollectionView 繼承自 ScrollView。可直接使用
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width + 0.6
        pageControl.currentPage = Int(page)
    }
}
