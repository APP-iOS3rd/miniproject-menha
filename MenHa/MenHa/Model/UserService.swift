//
//  UserService.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/27/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum AuthError: Error {
    case noneUserSession
    case noneUser
}

class UserService {
    static let shared = UserService()
    var userId: String?
    var currentUser: User?
    let db = Firestore.firestore()
    
    init() {
        userId = Auth.auth().currentUser?.uid // 현재 로그인한 유저 세션에서 유저 uid 가져오기
    }
    
    // 현재 로그인한 유저의 정보 리턴
    func getCurrentUser(completion: @escaping (Result<User, Error>) -> ()) {
        if let userId = userId {
            // User 구조체 형태로 현재 로그인한 유저의 정보를 리턴
            db.collection("users").document(userId).getDocument { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    guard let user = try? snapshot?.data(as: User.self) else { return }
                    self.currentUser = user
                    completion(.success(user))
                }
            }
        } else {
            completion(.failure(AuthError.noneUserSession))
        }
    }
    
    // 로그인
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()){
        Auth.auth().signIn(withEmail: email, password: password) {(user, error) in
            // user email, password가 일치하지 않는경우
            guard let user = user else {
                completion(.failure(AuthError.noneUser))
                return
            }
            // 스토어에 별도로 저장된 유저정보
            self.db.collection("users").document(user.user.uid).getDocument { snapShot, error in
                guard let userData = try? snapShot?.data(as: User.self)  else {return}
                self.currentUser = userData
                completion(.success(self.currentUser!))
            }
        }
    }
    
    // 로그아웃
    func logout(completion: @escaping (Bool) -> ()) {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            completion(true)
        } catch {
            completion(false)
        }
    }
}


