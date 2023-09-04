//
//  BannerViewModel.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/4.
//

import Foundation

struct BannerViewModel {
    func getBannerData(completion: @escaping ([BannerModel]) -> Void) {
        let dataRepository = DataRepository.shared
        
        dataRepository.getBannerData { result in
            switch result {
            case .success(let bannerArray):
                completion(bannerArray)
            case .failure:
                completion([])
            }
        }
    }
}
