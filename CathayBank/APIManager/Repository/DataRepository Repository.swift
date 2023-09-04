//
//  Favorite.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/4.
//

import Foundation

class DataRepository {
    public static let shared = DataRepository()
    
    private func fetchData<T: Decodable>(for dataType: T.Type, endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        APIManager.shared.request(endpoint: endpoint, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    //MARK: - Favorite
    /// 第一次登入抓空的 FavoriteData
    func getFirstLoginEmptyFavoriteData(completion: @escaping (Result<[FavoriteModel], Error>) -> Void) {
        let favoriteURL = APIInfo.emptyFavoriteList
        
        fetchData(for: FavoriteResponse.self, endpoint: favoriteURL) { result in
            switch result {
            case .success(let response):
                let favoriteArray = response.result
                completion(.success(favoriteArray))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    /// 重整抓新的 FavoriteData
    func getRefreshFavoriteData(completion: @escaping (Result<[FavoriteModel], Error>) -> Void) {
        let favoriteURL = APIInfo.favoriteList
        
        fetchData(for: FavoriteResponse.self, endpoint: favoriteURL) { result in
            switch result {
            case .success(let response):
                let favoriteArray = response.result
                completion(.success(favoriteArray))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
}
