//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import Foundation

struct NotificationModel {
    var status: Bool
    var updateDateTime: String
    var title: String
    var message: String
    
    init(status: Bool, updateDateTime: String, title: String, message: String) {
        self.status = status
        self.updateDateTime = updateDateTime
        self.title = title
        self.message = message
    }
}
