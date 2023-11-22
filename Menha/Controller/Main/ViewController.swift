//
//  ViewController.swift
//  Menha
//
//  Created by SeokkiKwon on 11/22/23.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    let db: Firestore = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        db.collection("test").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }


}

