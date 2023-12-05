//
//  ScheduleService.swift
//  MenHa
//
//  Created by SeokkiKwon on 12/5/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum NetworkError: Error {
    case fetchError
}

class ScheduleService {
    var schedules = [ReceiveSchedule]()
    let db = Firestore.firestore()
    let userService = UserService.shared
    
    func getSchedulesByUserId(completion: @escaping (Result<[ReceiveSchedule], Error>) -> ()) {
        guard let userId = userService.userId else {return}
        db.collection("users").document(userId).collection("mentoring").getDocuments { snapShot, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(NetworkError.fetchError))
            } else {
                for document in snapShot!.documents {
                    guard let schedule = try? document.data(as: ReceiveSchedule.self) else { return }
                    self.schedules.append(schedule)
                    completion(.success(self.schedules))
                }
            }
        }
    }
}
