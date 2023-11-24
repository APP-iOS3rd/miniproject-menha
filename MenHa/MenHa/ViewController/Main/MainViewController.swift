//
//  ViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goLoginScreen(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "Login", bundle: nil)
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func goMentoScreen(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "Mento", bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "MentoViewController") as? MentoViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func goMenteeScreen(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "Mentee", bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "MenteeViewController") as? MenteeViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}
