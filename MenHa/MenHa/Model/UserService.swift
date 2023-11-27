//
//  UserService.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/27/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    let shared = UserService()
    var userId: String?
    var currentUser: User?
    let db = Firestore.firestore()
    
    init() {
        userId = Auth.auth().currentUser?.uid // 현재 로그인한 유저 세션에서 유저 uid 가져오기
    }
    
    // 현재 로그인한 유저의 정보 리턴
    func getCurrentUser(completion: @escaping (User) -> ()) {
        guard let userId = userId else {return}
        // User 구조체 형태로 현재 로그인한 유저의 정보를 리턴
        db.collection("users").document(userId).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            completion(user)
        }
    }
}


