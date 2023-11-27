//
//  Extensions.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/27/23.
//

import Foundation
import UIKit

// URL로 이미지를 받아오기 위한 임시 확장
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
