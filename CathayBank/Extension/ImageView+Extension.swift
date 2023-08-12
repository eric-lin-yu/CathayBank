//
//  ImageView+Ext.swift
//  CathayBank
//
//  Created by wistronits on 2023/8/11.
//

import UIKit

extension UIImageView {
    public static func loadUrlImage(urlString: String, cacheKey: String = "", completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}

