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
    let result: [String: [AmountModel]]
    
    init(msgCode: String, msgContent: String, result: [String: [AmountModel]]) {
        self.msgCode = msgCode
        self.msgContent = msgContent
        self.result = result
    }
}

struct AmountModel: Codable {
    let account: String
    let curr: String
    let balance: Float
    
    init(account: String, curr: String, balance: Float) {
        self.account = account
        self.curr = curr
        self.balance = balance
    }
}
