//
//  MentoViewController.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/24/23.
//

import UIKit

class MentoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goMentoSchedule(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "ModifySchedule", bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "ModifyScheduleViewController") as? ModifyScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    
    @IBAction func goAddSchedule(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "AddSchedule", bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "AddMentoScheduleViewController") as? AddMentoScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func goMentoDetail(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: "MentoDetail", bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: "MentoDetailViewController") as? MentoDetailViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
}
