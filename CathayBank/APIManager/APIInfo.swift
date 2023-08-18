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
    
    // Banner
    public static let bannerList = baseDomain + "banner.json"
    
    // Amount - First Open
    private static let amountFirstOpenDomain = baseDomain + "amount/firstOpen/"
    
    // USD
    public static let firstUSD = amountFirstOpenDomain + "usdSavings1.json" // Savings
    public static let firstUSDFixedDeposited = amountFirstOpenDomain + "usdSavings1.json" // Fixed Deposits
    public static let firstUSDDigital = amountFirstOpenDomain + "usdDigital1.json" // Digital Accounts
    
    // KHR
    public static let firstKHR = amountFirstOpenDomain + "khrSavings1.json" // Savings
    public static let firstKHRFixedDeposited = amountFirstOpenDomain + "khrFixed1.json" // Fixed Deposits
    public static let firstKHRDigital = amountFirstOpenDomain + "khrDigital1.json" // Digital Accounts
    
    // Amount - Pull Refresh
    private static let amountRefreshDomain = baseDomain + "amount/pullRefresh/"
    
    // USD
    public static let refreshUSD = amountRefreshDomain + "usdSavings2.json" // Savings
    public static let refreshUSDFixedDeposited = amountRefreshDomain + "usdSavings2.json" // Fixed Deposits
    public static let refreshUSDDigital = amountRefreshDomain + "usdDigital2.json" // Digital Accounts
    
    // KHR
    public static let refreshKHR = amountRefreshDomain + "khrSavings2.json" // Savings
    public static let refreshKHRFixedDeposited = amountRefreshDomain + "khrFixed2.json" // Fixed Deposits
    public static let refreshKHRDigital = amountRefreshDomain + "khrDigital2.json" // Digital Accounts
}

