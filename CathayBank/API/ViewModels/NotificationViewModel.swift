//
//  NotificationViewModel.swift
//  CathayBank
//
//  Created by wistronits on 2023/9/7.
//

import Foundation

struct NotificationViewModel {
    public static let shared = NotificationViewModel()
    
    @MainActor
    func configureData(isFirstLogin: Bool, completion: @escaping ([NotificationModel]) -> Void) {
        if isFirstLogin {
            getEmptyNotificationData{ result in
                DispatchQueue.main.async {
                    completion([])
                }
            }
        } else {
            getRefreshNotificationData { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
    }
    
    
    private func getEmptyNotificationData(completion: @escaping ([NotificationModel]) -> Void) {
        let dataRepository = DataRepository.shared
        
        dataRepository.getEmptyNotificationData { result in
            switch result {
            case .success(let notificationArray):
                completion(notificationArray)
            case .failure:
                completion([])
            }
        }
    }
    
    private func getRefreshNotificationData(completion: @escaping ([NotificationModel]) -> Void) {
        let dataRepository = DataRepository.shared
        
        dataRepository.getRefreshNotificationData { result in
            switch result {
            case .success(let notificationArray):
                completion(notificationArray)
            case .failure:
                completion([])
            }
        }
    }
}
