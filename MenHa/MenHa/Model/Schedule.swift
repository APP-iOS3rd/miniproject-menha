//
//  Schedule.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/27/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreInternal

struct sendSchedule : Codable {
    var groupname: String
    var subject: String
    var isgroup: Bool
    var referencelinks: [String]
    var prgoressdate: Date
    var createuser: User
}

struct receiveSchedule : Codable {
    var groupname: String
    var subject: String
    var isgroup: Bool
    var referencelinks: [String]
    var prgoressdate: Int
    var createuser: User
}
