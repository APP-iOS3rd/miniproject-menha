//
//  CreateInvieteCodeViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

class CreateInvieteCodeViewController: UIViewController {

    @IBOutlet var inviteCodeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareInviteCode(_ sender: Any) {
        let text = "초대코드입니다. \(inviteCodeTextField)"
               
               // set up activity view controller
               let textToShare = [ text ]
               let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
               activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
               
               // exclude some activity types from the list (optional)
               activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
               
               // present the view controller
               self.present(activityViewController, animated: true, completion: nil)
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
