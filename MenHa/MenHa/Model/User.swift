//
//  User.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/28/23.
//

import Foundation

struct User: Codable {
    var name: String
    var email:String
    var password: String
    var whoareyou:Int
    var profileUrl: String
    
    init(name: String, email: String, password: String, whoareyou: Int, profileUrl: String = "") {
        self.name = name
        self.email = email
        self.password = password
        self.whoareyou = whoareyou
        self.profileUrl = profileUrl
    }
}
