// 화면 전환 시 오타 방지

import Foundation
import FirebaseFirestore

enum Main: String{
    case name = "Main"
    case id = "MainViewController"
}

enum Login: String {
    case name = "Login"
    case id = "LoginViewController"
}

enum Register: String {
    case name = "Register"
    case id = "RegisterViewController"
}

enum MentoDetail: String {
    case name = "MentoDetail"
    case id = "MentoDetailViewController"
}

enum MenteeDetail: String {
    case name = "MenteeDetail"
    case id = "MenteeDetailViewController"
}

enum Mento: String {
    case name = "Mento"
    case id = "MentoViewController"
}

enum Mentee: String {
    case name = "Mentee"
    case id = "MenteeViewController"
}

enum CreateCode: String {
    case name = "CreateCode"
    case id = "CreateInvieteCodeViewController"
}

enum AddSchedule: String {
    case name = "AddSchedule"
    case id = "AddMentoScheduleViewController"
}

enum AddCode: String {
    case name = "AddCode"
    case id = "AddMentiScheduleViewController"
}

enum Modify: String{
    case name = "ModifySchedule"
    case id = "ModifyScheduleViewController"
}

let COLLECTION_USERS = Firestore.firestore().collection("users")
