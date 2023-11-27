//
//  Schedule.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/27/23.
//

import Foundation
import FirebaseCore

struct Schedule {
    var groupname: String
    var subject: String
    var isgroup: Bool
    var referencelinks: [String]
    var prgoressdate: Date
    var createuser: User
}
