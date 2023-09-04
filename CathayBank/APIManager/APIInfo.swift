//
//  API.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/12.
//

import Foundation

struct APIInfo {
    // API domain
    private static let baseDomain = "https://willywu0201.github.io/data/"
        
    // Notifications
    public static let notificationList = baseDomain + "notificationList.json"
    public static let emptyNotificationList = baseDomain + "emptyNotificationList.json"

    // USD
    public static let firstUSD = baseDomain + "usdSavings1.json"
    public static let firstUSDFixedDeposited = baseDomain + "usdFixed1.json"
    public static let firstUSDDigital = baseDomain + "usdDigital1.json"
    
    public static let refreshUSD = baseDomain + "usdSavings2.json"
    public static let refreshUSDFixedDeposited = baseDomain + "usdFixed2.json"
    public static let refreshUSDDigital = baseDomain + "usdDigital2.json"
    
    // KHR
    public static let firstKHR = baseDomain + "khrSavings1.json"
    public static let firstKHRFixedDeposited = baseDomain + "khrFixed1.json"
    public static let firstKHRDigital = baseDomain + "khrDigital1.json"
    
    public static let refreshKHR = baseDomain + "khrSavings2.json"
    public static let refreshKHRFixedDeposited = baseDomain + "khrFixed2.json"
    public static let refreshKHRDigital = baseDomain + "khrDigital2.json"
    
    // Favorites
    public static let favoriteList = baseDomain + "favoriteList.json"
    public static let emptyFavoriteList = baseDomain + "emptyFavoriteList.json"
    
    // ad
    public static let adBanner = baseDomain + "banner.json"
}

