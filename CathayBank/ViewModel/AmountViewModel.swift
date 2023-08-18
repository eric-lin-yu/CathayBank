//
//  AmountViewModel.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/18.
//

import Foundation

struct AmountViewModel {
    let shared = APIManager.shared
    
    // USD First
    func getFirstUSDSaving(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.firstUSD, method: .get, completion: completion)
    }
    
    func getFirstUSDFixedDeposited(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.firstUSDFixedDeposited, method: .get, completion: completion)
    }
    
    func getFirstUSDDigital(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.firstUSDDigital, method: .get, completion: completion)
    }
    
    // USD Pull Refresh
    func getRefreshUSDSaving(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.refreshUSD, method: .get, completion: completion)
    }
    
    func getRefreshUSDFixedDeposited(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.refreshUSDFixedDeposited, method: .get, completion: completion)
    }
    
    func getRefreshUSDDigital(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.refreshUSDDigital, method: .get, completion: completion)
    }
    
    // KHR First
    func getFirstKHRSaving(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.firstKHR, method: .get, completion: completion)
    }
    
    func getFirstKHRFixedDeposited(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.firstKHRFixedDeposited, method: .get, completion: completion)
    }
    
    func getFirstKHRDigital(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.firstKHRDigital, method: .get, completion: completion)
    }
    
    // KHR Pull Refresh
    func getRefreshKHRSaving(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.refreshKHR, method: .get, completion: completion)
    }
    
    func getRefreshKHRFixedDeposited(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.refreshKHRFixedDeposited, method: .get, completion: completion)
    }
    
    func getRefreshKHRDigital(completion: @escaping (APIResult) -> Void) {
        shared.request(endpoint: APIInfo.refreshKHRDigital, method: .get, completion: completion)
    }
}
