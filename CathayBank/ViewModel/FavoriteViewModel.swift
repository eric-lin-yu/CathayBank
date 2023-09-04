//
//  File.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/4.
//

import Foundation

struct FavoriteViewModel {
    func getFirstLoginEmptyFavoriteData(completion: @escaping ([FavoriteModel]) -> Void) {
        let dataRepository = DataRepository.shared

        dataRepository.getFirstLoginEmptyFavoriteData { result in
            switch result {
            case .success(let favoriteArray):
                completion(favoriteArray)
            case .failure:
                completion([])
            }
        }
    }
    
    func getRefreshFavoriteData(completion: @escaping ([FavoriteModel]) -> Void) {
        let dataRepository = DataRepository.shared

        dataRepository.getRefreshFavoriteData { result in
            switch result {
            case .success(let favoriteArray):
                completion(favoriteArray)
            case .failure:
                completion([])
            }
        }
    }
    
}
