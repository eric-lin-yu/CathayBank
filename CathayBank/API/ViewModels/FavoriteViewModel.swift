//
//  File.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/4.
//

import Foundation

struct FavoriteViewModel {
    public static let shared = FavoriteViewModel()
    
    @MainActor
    func configureData(isFirstLogin: Bool, completion: @escaping ([FavoriteModel]) -> Void) {
        if isFirstLogin {
            getFirstLoginEmptyFavoriteData { _ in
                DispatchQueue.main.async {
                    completion([])
                }
            }
        } else {
            getRefreshFavoriteData { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
    }
    
    private func getFirstLoginEmptyFavoriteData(completion: @escaping ([FavoriteModel]) -> Void) {
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
    
    private func getRefreshFavoriteData(completion: @escaping ([FavoriteModel]) -> Void) {
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
