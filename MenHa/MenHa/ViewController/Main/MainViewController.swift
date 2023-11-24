//
//  ViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

class MainViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setIsLogin()
    }
    
    @IBAction func testBtn(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "Login", bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        }
    }
    private func setIsLogin(){
//        let loginStoryBoard = UIStoryboard(name: SCREEN_NAME.LOGIN.storyBoardName, bundle: nil)
//        if appDelegate?.isLoggedIn == false {
//            if let loginViewController = loginStoryBoard.instantiateViewController(withIdentifier: SCREEN_NAME.LOGIN.viewControllerIdentifier) as? LoginViewController {
//                // Perform the navigation
//                self.navigationController?.setViewControllers([loginViewController], animated: true)
//            }
//        }
    }
}
