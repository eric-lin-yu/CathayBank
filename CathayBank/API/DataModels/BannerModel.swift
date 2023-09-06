//
//  ViewController.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import Foundation
struct BannerResponse: Codable {
    let msgCode: String
    let msgContent: String
    let result: BannerResultData
    
    init(msgCode: String, msgContent: String, result: BannerResultData) {
        self.msgCode = msgCode
        self.msgContent = msgContent
        self.result = result
    }
}

struct BannerResultData: Codable {
    let bannerList: [BannerModel]
}

struct BannerModel: Codable {
    var adSeqNo: Int
    var linkUrl: String
    
    init(adSeqNo: Int, linkUrl: String) {
        self.adSeqNo = adSeqNo
        self.linkUrl = linkUrl
    }
}
