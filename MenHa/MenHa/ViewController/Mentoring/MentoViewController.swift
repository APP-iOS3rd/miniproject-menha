//
//  MentoViewController.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/24/23.
//

import UIKit

class MentoViewController: UIViewController {
    //    var datas = [Schedule(groupname: "앱스쿨 멘토링 3기", subject: "MVVM 디자인 패턴", isgroup: true,  referencelinks: [""], prgoressdate: Date(), createuser: User(profileUrl: "https://likelion.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Fc69962b0-3951-485b-b10a-5bb29576bba8%2Fcef4fc48-74ee-4f78-b3cd-27e0fb52c910%2FIMG_0930.jpg?table=block&id=cee590b7-f63a-43d8-aa99-305f3a93ee46&spaceId=c69962b0-3951-485b-b10a-5bb29576bba8&width=2000&userId=&cache=v2")),
    //                 Schedule(groupname: "네이버 부스트캠프 멤버쉽", subject: "SnapKit", isgroup: true,  referencelinks: [""], prgoressdate: Date(), createuser: User(profileUrl: "https://likelion.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Fc69962b0-3951-485b-b10a-5bb29576bba8%2F64728591-92bd-4de5-812f-454e32ae2c70%2Fhowlab_logo_v1_w.png?table=block&id=f7de4abe-10c2-49d6-83e6-8538f30bf1fe&spaceId=c69962b0-3951-485b-b10a-5bb29576bba8&width=2000&userId=&cache=v2")),
    //                 Schedule(groupname: "우아한 테크코스 멘토링", subject: "ObjectMapper 공부해오기", isgroup: true,  referencelinks: [""], prgoressdate: Date(), createuser: User(profileUrl: "https://likelion.notion.site/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Fc69962b0-3951-485b-b10a-5bb29576bba8%2F0231c2a7-df2a-4b94-bdd2-2d3c04195874%2Fleeo_square.jpg?table=block&id=b2124817-54f5-42a5-931b-2b73c4cf76c2&spaceId=c69962b0-3951-485b-b10a-5bb29576bba8&width=2000&userId=&cache=v2")),
    //    ]
    @IBOutlet var addScheduleButton: UIButton! // 멘토링 일정등록 으로 이동
    @IBOutlet var tableView: UITableView! // tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self // tableView의 delegate를 현재 인스턴스로 지정
        tableView.dataSource = self // tableView의 datasource를 현재 인스턴스로 지정
        
    }
    
    @IBAction func goAddSchedule(_ sender: Any) {
        let secondStoryboard = UIStoryboard(name: AddSchedule.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let secondViewController = secondStoryboard.instantiateViewController(withIdentifier: AddSchedule.id.rawValue) as? AddMentoScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}

extension MentoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleTableViewCell
        
        //        let row = indexPath.row
        //        cell.groupName.text = datas[row].groupname
        //        cell.progressData.text = DataHelper.dateFormatter(date: Date())
        //        cell.prgressUnit.text = "화요일 진행"
        //        let url = URL(string: datas[row].createuser.profileUrl)
        //        cell.userImage.load(url: url!)
        return cell
    }
    
    
}
