//
//  DetailViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

class MentoDetailViewController: UIViewController {
    var imageUrl:URL?
    var mentoName: String?
    var subject: String?
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var mentoNameLabel: UILabel!
    @IBOutlet var mentoProfileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
  
        setScheduleData()
    }
    
    func setScheduleData() {
        if let imageUrl = imageUrl {
            mentoProfileImage.load(url: imageUrl)
        }
        mentoNameLabel.text = mentoName
        subjectLabel.text = subject
        tableViewHeight.constant = 132 * 4 + 10
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

extension MentoDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MentoDetailTableViewCell", for: indexPath) as! MentoDetailTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    
}
