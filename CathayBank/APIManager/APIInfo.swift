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
    
    // Favorites
    public static let favoriteList = baseDomain + "favoriteList.json"
    
    // Notifications
    public static let notificationList = baseDomain + "notificationList.json"
    public static let emptyNotificationList = baseDomain + "emptyNotificationList.json"

    // 初次登入
    // USD
    public static let firstUSD = baseDomain + "usdSavings1.json" // Savings
    public static let firstUSDFixedDeposited = baseDomain + "usdFixed1.json" // Fixed Deposits
    public static let firstUSDDigital = baseDomain + "usdDigital1.json" // Digital Accounts
    
    // KHR
    public static let firstKHR = baseDomain + "khrSavings1.json" // Savings
    public static let firstKHRFixedDeposited = baseDomain + "khrFixed1.json" // Fixed Deposits
    public static let firstKHRDigital = baseDomain + "khrDigital1.json" // Digital Accounts
    
    // 重整抓取資料
    // USD
    public static let refreshUSD = baseDomain + "usdSavings2.json" // Savings
    public static let refreshUSDFixedDeposited = baseDomain + "usdFixed2.json" // Fixed Deposits
    public static let refreshUSDDigital = baseDomain + "usdDigital2.json" // Digital Accounts
    
    // KHR
    public static let refreshKHR = baseDomain + "khrSavings2.json" // Savings
    public static let refreshKHRFixedDeposited = baseDomain + "khrFixed2.json" // Fixed Deposits
    public static let refreshKHRDigital = baseDomain + "khrDigital2.json" // Digital Accounts
}

