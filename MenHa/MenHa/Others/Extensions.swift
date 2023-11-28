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

// 객체 생성 후 DB에 편하게 집어넣기 위한 확장
extension Encodable {
    func asDictionary() -> [String:Any] {
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
