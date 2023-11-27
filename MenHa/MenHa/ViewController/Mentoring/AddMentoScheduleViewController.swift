//
//  AddMentoScheduleViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

class AddMentoScheduleViewController: UIViewController {
    let userService  = UserService()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addSchedule(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: CreateCode.name.rawValue, bundle: nil)
         
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: CreateCode.id.rawValue) as? CreateInvieteCodeViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
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
