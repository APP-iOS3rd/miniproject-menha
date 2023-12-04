//
//  ModifyScheduleViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

class ModifyScheduleViewController: UIViewController {
    
    @IBOutlet weak var groupname: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var referencelinks: UITextView!
    @IBOutlet weak var isgroup: UISegmentedControl!// selectedSegmentIndex( 개인 == 0, 그룹 == 1 )
    @IBOutlet weak var progressdate: UIDatePicker!

    // 건네받은 Schedule 모델을 토대로 각 textfield, textview, datepicker 재구성하기
    var modifySchedule : receiveSchedule?
    
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

}
