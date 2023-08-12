//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import Foundation

struct FavoriteModel {
    var nickname: String
    var transType: String
    
    init(nickname: String, transType: String) {
        self.nickname = nickname
        self.transType = transType
    }
}
