//
//  AddMentoScheduleViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class AddMentoScheduleViewController: UIViewController {
    let userService  = UserService()

    @IBOutlet weak var groupname: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var referencelinks: UITextView!
    @IBOutlet weak var isgroup: UISegmentedControl! // selectedSegmentIndex( 개인 == 0, 그룹 == 1 )
    @IBOutlet weak var progressdate: UIDatePicker!
    
    var selectTime : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addSchedule(_ sender: Any) {
        
        guard canSave else { return }
        
        let db = Firestore.firestore()
        let newId = UUID().uuidString
        
        let newSchedule = SendSchedule(groupname: groupname.text ?? "",
                                   subject: subject.text ?? "",
                                   isgroup: isgroup.selectedSegmentIndex == 0 ? false : true,
                                   referencelinks: [],
                                   prgoressdate: progressdate.date,
                                   createuser: userService.currentUser!,
                                   documentId: newId
        )
        
        db.collection("users")
            .document(userService.userId!)
            .collection("mentoring")
            .document(newId)
            .setData(newSchedule.asDictionary())
        
        
        // 초대코드 생성 화면으로 이동
        let secondStoryboard = UIStoryboard(name: CreateCode.name.rawValue, bundle: nil)
         
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: CreateCode.id.rawValue) as? CreateInvieteCodeViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    var canSave: Bool {
        guard groupname.text != "", subject.text != "" else {
            print("Error ! - 비어 있는 칸을 모두 입력하세요!")
            return false
        }
        
        print(type(of: progressdate.date) )
        
        return true
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
