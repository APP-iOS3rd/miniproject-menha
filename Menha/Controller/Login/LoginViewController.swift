//
//  LoginViewController.swift
//  Menha
//
//  Created by SeokkiKwon on 11/22/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var Userpassword: UITextField!
    @IBOutlet var Useremail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createNewUser(_ sender: Any) {
        var email : String = Useremail.text ?? ""
        var password : String = Userpassword.text ?? ""
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("failed becasue of \(error)")
                return
            } else {
                print("user added")
            }
        }
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
