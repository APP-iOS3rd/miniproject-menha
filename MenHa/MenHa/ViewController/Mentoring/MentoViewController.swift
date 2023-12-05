//
//  MentoViewController.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/24/23.
//

import UIKit

class MentoViewController: UIViewController {
    let userService = UserService.shared
    let scheduleService = ScheduleService()
    var schedules = [ReceiveSchedule]()
    
    @IBOutlet var addScheduleButton: UIButton! // 멘토링 일정등록 으로 이동
    @IBOutlet var tableView: UITableView! // tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self // tableView의 delegate를 현재 인스턴스로 지정
        tableView.dataSource = self // tableView의 datasource를 현재 인스턴스로 지정
        setScheduleData()
    }
    
    func setScheduleData() {
        scheduleService.getSchedulesByUserId { result in
            switch result {
            case .success(let schedules):
                self.schedules = schedules
                self.tableView.reloadData()
            case .failure(let _):
                print(1)
            }
        }
    }
    
    @IBAction func goAddSchedule(_ sender: Any) {
        let storyboard = UIStoryboard(name: AddSchedule.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let targetController = storyboard.instantiateViewController(withIdentifier: AddSchedule.id.rawValue) as? AddMentoScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(targetController, animated: true)
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        userService.logout { result in
            if result {
                let storyboard = UIStoryboard(name: Login.name.rawValue, bundle: nil)
                if let targetController = storyboard.instantiateViewController(withIdentifier: Login.id.rawValue) as? LoginViewController {
                    
                    // Perform the navigation
                    guard let loginViewController = storyboard.instantiateViewController(withIdentifier: Login.id.rawValue) as? LoginViewController else { return }
                    if let window = UIApplication.shared.windows.first {
                        if let navigationController = window.rootViewController as? UINavigationController {
                            // 네비게이션 스택에 쌓인 모든 뷰 컨트롤러를 제거합니다.
                            navigationController.viewControllers = []
                            window.rootViewController = UINavigationController(rootViewController: targetController)
                        }
                    }
                }
            } else {
                
            }
        }
    }
    
    
    @IBAction func segmentControllChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        if selectedIndex == 0 {
            schedules = scheduleService.schedules
        } else if selectedIndex == 1 {
            schedules = scheduleService.schedules.filter{!$0.isgroup}
        } else if selectedIndex == 2 {
            schedules = scheduleService.schedules.filter{$0.isgroup}
        }
        tableView.reloadData()
    }
    
}

extension MentoViewController: UITableViewDelegate, UITableViewDataSource {
    /**
            받아와야하는 데이터
              멘토사진, 멘토링이름, 
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleTableViewCell
        cell.modifyBtn.tag = indexPath.row
        cell.modifyBtn.addTarget(self, action: #selector(modifyBtnClicked(sender: )), for: .touchUpInside)
        // cell style
        cell.selectionStyle = .none
        
        // set cell data
        cell.groupName.text = schedules[indexPath.row].groupname
        // profileUrl
        let url = URL(string: schedules[indexPath.row].createuser.profileUrl)
        cell.userImage.load(url: url!)
        return cell
    }
    
    // cell을 눌렀을 때 scheduleDetail로 가는 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: MentoDetail.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let mentoViewController = storyboard.instantiateViewController(withIdentifier: MentoDetail.id.rawValue) as? MentoDetailViewController {
            let url = URL(string: schedules[indexPath.row].createuser.profileUrl)
            mentoViewController.imageUrl = url!
            mentoViewController.mentoName = schedules[indexPath.row].createuser.name
            mentoViewController.subject = schedules[indexPath.row].subject
            // Perform the navigation
            self.navigationController?.pushViewController(mentoViewController, animated: true)
        }
    }
    
    // cell의 수정 버튼을 눌렀을 때 ModifySchedule로 가는 함수
    @objc func modifyBtnClicked(sender: UIButton) {
        print("\(sender.tag) 버튼의 tag로 index값을 받아서 데이터 처리하기")
        let storyboard = UIStoryboard(name: Modify.name.rawValue, bundle: nil)
        
        // Instantiate the desired view controller from the second storyboard
        if let targetController = storyboard.instantiateViewController(withIdentifier: Modify.id.rawValue) as? ModifyScheduleViewController {
            
            // Perform the navigation
            self.navigationController?.pushViewController(targetController, animated: true)
        }
    }
    
}
