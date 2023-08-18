//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import Foundation
struct AmountResponse: Codable {
    let msgCode: String
    let msgContent: String
    let result: AmountResult
}

struct AmountResult: Codable {
    let savingsList: [AmountAccount]
}

struct AmountAccount: Codable {
    let account: String
    let curr: String
    let balance: Double
    
    init(account: String, curr: String, balance: Double) {
        self.account = account
        self.curr = curr
        self.balance = balance
    }
}
