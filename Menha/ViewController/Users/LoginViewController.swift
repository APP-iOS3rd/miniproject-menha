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
    

    @IBAction func UserLogin(_ sender: Any) {
        var email : String = Useremail.text ?? ""
        var password : String = Userpassword.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("login success")
            }else{ print("login fail")}
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
