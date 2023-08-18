//
//  AmountViewModel.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/18.
//

import Foundation

struct SavingsViewModel {
    private let apiManager = APIManager.shared
    
    func fetchUSDSavings(completion: @escaping (Result<[AmountAccount], Error>) -> Void) {
        apiManager.request(endpoint: APIInfo.firstUSD, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let savings = try JSONDecoder().decode([AmountAccount].self, from: data)
                    completion(.success(savings))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchKHRSavings(completion: @escaping (Result<[AmountAccount], Error>) -> Void) {
        apiManager.request(endpoint: APIInfo.firstKHR, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let savings = try JSONDecoder().decode([AmountAccount].self, from: data)
                    completion(.success(savings))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
