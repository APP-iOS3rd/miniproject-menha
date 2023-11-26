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

    @IBAction func goScheduleModify(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: Modify.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: Modify.id.rawValue) as? ModifyScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    
    @IBAction func goAddSchedule(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: AddSchedule.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: AddSchedule.id.rawValue) as? AddMentoScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func goMentoDetail(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: MentoDetail.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: MentoDetail.id.rawValue) as? MentoDetailViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
}
