//
//  APIManager.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/18.
//

import Foundation

class AmountRepository {
    public static let shared = AmountRepository()
    
    private let apiManager: APIManager
    
    private init(apiManager: APIManager = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    private func getTotalBalance(for endpoint: String, completion: @escaping (Result<Float, Error>) -> Void) {
        apiManager.request(endpoint: endpoint, method: .get) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let amountResponse = try decoder.decode(AmountResponse.self, from: data)
                    
                    if let resultList = amountResponse.result.first?.value {
                        let totalBalance = resultList.reduce(0.0) { $0 + $1.balance }
                        completion(.success(totalBalance))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// 第一次登入 USD 金額
    func getFirstUSDTotal(completion: @escaping (Result<Float, Error>) -> Void) {
        let savingsURL = APIInfo.firstUSD
        let fixedDepositsURL = APIInfo.firstUSDFixedDeposited
        let digitalAccountsURL = APIInfo.firstUSDDigital
        
        let dispatchGroup = DispatchGroup()
        var totalBalances: [Float] = []
        
        dispatchGroup.enter()
        getTotalBalance(for: savingsURL) { result in
            switch result {
            case .success(let totalBalance):
                totalBalances.append(totalBalance)
            case .failure(let error):
                completion(.failure(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getTotalBalance(for: fixedDepositsURL) { result in
            switch result {
            case .success(let totalBalance):
                totalBalances.append(totalBalance)
            case .failure(let error):
                completion(.failure(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getTotalBalance(for: digitalAccountsURL) { result in
            switch result {
            case .success(let totalBalance):
                totalBalances.append(totalBalance)
            case .failure(let error):
                completion(.failure(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            let totalSum = totalBalances.reduce(0.0, +)
            completion(.success(totalSum))
        }
    }
    
    
    /// 第一次登入 KHR 金額
    func getFirstKHRTotal(completion: @escaping (Result<Float, Error>) -> Void) {
        let savingsURL = APIInfo.firstKHR
        let fixedDepositsURL = APIInfo.firstKHRFixedDeposited
        let digitalAccountsURL = APIInfo.firstKHRDigital
        
        let dispatchGroup = DispatchGroup()
        var totalBalances: [Float] = []
        
        dispatchGroup.enter()
        getTotalBalance(for: savingsURL) { result in
            switch result {
            case .success(let totalBalance):
                totalBalances.append(totalBalance)
            case .failure(let error):
                completion(.failure(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getTotalBalance(for: fixedDepositsURL) { result in
            switch result {
            case .success(let totalBalance):
                totalBalances.append(totalBalance)
            case .failure(let error):
                completion(.failure(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getTotalBalance(for: digitalAccountsURL) { result in
            switch result {
            case .success(let totalBalance):
                totalBalances.append(totalBalance)
            case .failure(let error):
                completion(.failure(error))
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            let totalSum = totalBalances.reduce(0.0, +)
            completion(.success(totalSum))
        }
    }
    
}

