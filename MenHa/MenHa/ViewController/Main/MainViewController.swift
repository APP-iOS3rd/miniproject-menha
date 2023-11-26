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
        let loginStoryBoard = UIStoryboard(name: Login.name.rawValue, bundle: nil)
        // Instantiate the desired view controller from the second storyboard
        if let loginViewController = loginStoryBoard.instantiateViewController(withIdentifier: Login.id.rawValue) as? LoginViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
    
    @IBAction func goMentoScreen(_ sender: Any) {
        let mentoStorayBoard = UIStoryboard(name: Mento.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let mentoViewController = mentoStorayBoard.instantiateViewController(withIdentifier: Mento.id.rawValue) as? MentoViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(mentoViewController, animated: true)
        }
    }
    
    @IBAction func goMenteeScreen(_ sender: Any) {
        let menteeStoryboard = UIStoryboard(name: Mentee.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let menteeViewController = menteeStoryboard.instantiateViewController(withIdentifier: Mentee.id.rawValue) as? MenteeViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(menteeViewController, animated: true)
        }
    }
}
