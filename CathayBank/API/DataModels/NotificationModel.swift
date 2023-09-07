//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import Foundation
struct NotificationResponse: Codable {
    let msgCode: String
    let msgContent: String
    let result: NotificationResultData
    
    init(msgCode: String, msgContent: String, result: NotificationResultData) {
        self.msgCode = msgCode
        self.msgContent = msgContent
        self.result = result
    }
}

struct NotificationResultData: Codable {
    let messages: [NotificationModel]
}

struct NotificationModel: Codable {
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
