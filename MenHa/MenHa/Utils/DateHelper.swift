//
//  Date.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/27/23.
//

import Foundation

class DataHelper {
    static func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let convertDate = dateFormatter.string(from: date)
        return convertDate
    }
}
