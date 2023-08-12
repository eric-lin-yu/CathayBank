//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import Foundation

struct AmountModel {
    var account: String
    var curr: String
    var balance: Float
    
    init(account: String, curr: String, balance: Float) {
        self.account = account
        self.curr = curr
        self.balance = balance
    }
}
