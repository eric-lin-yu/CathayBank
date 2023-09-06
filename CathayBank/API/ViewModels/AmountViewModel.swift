//
//  AmountViewModel.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/18.
//

import Foundation

struct AmountViewModel {
    func getFirstUSDTotal(completion: @escaping (String) -> Void) {
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
    
    func getRefreshUSDTotal(completion: @escaping (String) -> Void) {
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
    
    func getFirstKHRTotal(completion: @escaping (String) -> Void) {
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
    
    func getRefreshKHRTotal(completion: @escaping (String) -> Void) {
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
