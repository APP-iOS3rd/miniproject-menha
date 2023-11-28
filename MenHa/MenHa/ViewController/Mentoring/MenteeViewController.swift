//
//  MenteeViewController.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/24/23.
//

import UIKit

class MenteeViewController: UIViewController {
    let user = UserService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.user.logout { resulr in
                resulr
            }
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goMenteeDetail(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: MenteeDetail.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: MenteeDetail.id.rawValue) as? MenteeDetailViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    
    @IBAction func addCode(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: AddCode.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: AddCode.id.rawValue) as? AddMentiScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}
