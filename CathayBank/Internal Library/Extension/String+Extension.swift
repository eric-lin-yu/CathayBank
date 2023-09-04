//
//  String+Extension.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/12.
//

import Foundation

extension String {
    var formattedAmount: String {
        let number = (self as NSString).floatValue
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        formatter.roundingMode = .down
        formatter.groupingSeparator = ","
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
