//
//  RegisterViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController : UIViewController {
    
    @IBOutlet var Username: UITextField!
    @IBOutlet var Useremail: UITextField!
    @IBOutlet var Userpassword: UITextField!
    @IBOutlet var UserpasswordDC: UITextField!
    var flag: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    @IBAction func createNewUser(_ sender: Any) {
        var email : String = Useremail.text ?? ""
        var password : String = Userpassword.text ?? ""
        var name : String = Username.text ?? ""
        var passwordDC : String = UserpasswordDC.text ?? ""
        let db = Firestore.firestore()
        if self.anyException(email, password, name, passwordDC) {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("failed becasue of \(error)")
                return
            } else {
                db.collection("users").addDocument(data: [
                        "name": name,
                        "email": email,
                        "password": password,
                        "whoareyou": self.flag
                    ])
                print("user added")
            }
        }
        let pushvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginScreenAY")
        self.navigationController?.pushViewController(pushvc!, animated: true)

    }
    @IBAction func IAmMentor(_ sender: Any) {
        flag = 1
    }
    @IBAction func IAmMentee(_ sender: Any) {
        flag = 2
    }
    
    
    @IBAction func SignUpComplete(_ sender: Any) {
//        네비게이션을 이용한 방식
//        Back 버튼이 생겨서 로그인뷰에는 적절하지않은것같음
        var location : String = ""
        if flag == 0 {
            return
        }
        if flag == 1 {
            location = "MentoSked"
        } else if flag == 2 {
            location = "MentoSked"
        }
//        let pushvc = storyboard?.instantiateViewController(withIdentifier: location)
//        navigationController?.pushViewController(pushvc!, animated: true)
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: location) else {return}
//        self.navigationController?.pushViewController(nextVC, animated: true)
        
//        let test = UIStoryboard.init(name: "Mentoring", bundle: nil)
//        guard let vc = test.instantiateViewController(withIdentifier: "MentoSked") as? MentoSkedViewController else{return}
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        pushvc?.modalPresentationStyle = .fullScreen
//        pushvc?.modalTransitionStyle = .crossDissolve
//        self.present(pushvc!, animated: true, completion: nil)
        
//        let secondStoryboard = UIStoryboard(name: "MentoSked", bundle: nil)
//
//                // Instantiate the desired view controller from the second storyboard
//        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "MentoSked") as? MentoSkedViewController {
//
//            // Perform the navigation
//            self.navigationController?.pushViewController(secondViewController, animated: true)
//        }
    }
    
    func anyException(_ email : String , _ password : String , _ name : String, _ passwordDC : String) -> Bool {
        if email == "" || password == "" || name == "" || passwordDC == "" {
            print("You either don't have name, password, email or passwordDC")
            return true
        }
        if password != passwordDC {
            print("Match your password")
            return true
        }
        if flag != 1 && flag != 2 {
            print("Choose your role")
            return true
        }
        return false
    }
}
