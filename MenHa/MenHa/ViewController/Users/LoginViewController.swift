//
//  LoginViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {


    @IBOutlet var Userpassword: UITextField!
    @IBOutlet var Useremail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func UserLogin(_ sender: Any) {
        
        let email : String = Useremail.text ?? ""
        let password : String = Userpassword.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("login success")
                let db = Firestore.firestore()
                let userRef = db.collection("users")
                let query = userRef
                    .whereField("email", isEqualTo: email)
                    .whereField("password", isEqualTo: password)
                query.getDocuments() { (snapshot, error) in
                    if let error = error {
                        print("Query error \(error)")
                        return
                    } else {
                        for doc in snapshot!.documents {
                            let data = doc.data()
                            let checking = data["whoareyou"] as? Int ?? 0
                            if checking == 0 {
                                print("Role empty")
                                return
                            }
                            if checking == 1 {
//                                let test = UIStoryboard.init(name: "Mentoring", bundle: nil)
//                                guard let vc = test.instantiateViewController(withIdentifier: "MentoSked") as? MentoSkedViewController else{return}
//                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                            if checking == 2 {
//                                let test = UIStoryboard.init(name: "Mentoring", bundle: nil)
//                                guard let vc = test.instantiateViewController(withIdentifier: "MentiSked") as? MentiSkedViewController else{return}
//                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                        }
                    }
                }
            }else{
                print("login fail")
                return
            }
        }
    }
    
    @IBAction func moveToRegisterView(_ sender: Any) {
        let test = UIStoryboard.init(name: Register.name.rawValue, bundle: nil)
        guard let vc = test.instantiateViewController(withIdentifier: Register.id.rawValue) as? RegisterViewController else{return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
