//
//  AmountViewModel.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/18.
//

import Foundation

struct AmountViewModel {
    public static let shared = AmountViewModel()
    
    @MainActor
    func configureData(isFirstLogin: Bool, completion: @escaping (String, String) -> Void) {
        if isFirstLogin {
            getFirstUSDTotal { usdTotal in
                getFirstKHRTotal { khrTotal in
                    completion(usdTotal, khrTotal)
                }
            }
        } else {
            getRefreshUSDTotal { usdTotal in
                getRefreshKHRTotal { khrTotal in
                    completion(usdTotal, khrTotal)
                }
            }
        }
    }
    
    private func getFirstUSDTotal(completion: @escaping (String) -> Void) {
        let amountRepository = AmountRepository.shared
        
        amountRepository.getFirstLoginUSDBalance { result in
            switch result {
            case .success(let total):
                let usdTotal = "\(total)".formattedAmount
                completion(usdTotal)
            case .failure(let error):
                completion("error: \(error)")
            }
        }
    }
    
    private func getRefreshUSDTotal(completion: @escaping (String) -> Void) {
        let amountRepository = AmountRepository.shared
        
        amountRepository.getRefreshUSDBalance { result in
            switch result {
            case .success(let total):
                let usdTotal = "\(total)".formattedAmount
                completion(usdTotal)
            case .failure(let error):
                completion("error: \(error)")
            }
        }
    }
    
    private func getFirstKHRTotal(completion: @escaping (String) -> Void) {
        let amountRepository = AmountRepository.shared
        
        amountRepository.getFirstLoginKHRBalance { result in
            switch result {
            case .success(let total):
                let usdTotal = "\(total)".formattedAmount
                completion(usdTotal)
            case .failure(let error):
                completion("error: \(error)")
            }
        }
    }
    
    private func getRefreshKHRTotal(completion: @escaping (String) -> Void) {
        let amountRepository = AmountRepository.shared
        
        amountRepository.getRefreshKHRBalance { result in
            switch result {
            case .success(let total):
                let usdTotal = "\(total)".formattedAmount
                completion(usdTotal)
            case .failure(let error):
                completion("error: \(error)")
            }
        }
    }
}
