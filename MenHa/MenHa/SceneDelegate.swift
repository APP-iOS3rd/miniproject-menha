//
//  SceneDelegate.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    let userService = UserService.shared
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // 이동이 필요한 스토리보드를 변수에 저장
        let mentoStoryboard = UIStoryboard(name: Mento.name.rawValue, bundle: nil)
        let menteeStoryboard = UIStoryboard(name: Mentee.name.rawValue, bundle: nil)
        let loginStoryboard = UIStoryboard(name: Login.name.rawValue, bundle: nil)
        
        // 유저세션을 확인하여 현재 로그인된 유저 정보를 가져옵니다.
        userService.getCurrentUser { result in
            switch result {
                // 로그인된 유저라면 멘토, 멘티를 확인한뒤 다른 화면으로 이동
            case .success(let user):
                if user.whoareyou == 1 {
                    guard let mentoViewController = mentoStoryboard.instantiateViewController(withIdentifier: Mento.id.rawValue) as? MentoViewController else { return }
                    let navigationCotroller = UINavigationController(rootViewController: mentoViewController)
                    self.window?.rootViewController = navigationCotroller
                } else {
                    guard let menteeViewController = menteeStoryboard.instantiateViewController(withIdentifier: Mentee.id.rawValue) as? MenteeViewController else { return }
                    let navigationCotroller = UINavigationController(rootViewController: menteeViewController)
                    self.window?.rootViewController = navigationCotroller
                }
            case .failure(let _):
                
                guard let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: Login.id.rawValue) as? LoginViewController else { return }
                let navigationCotroller = UINavigationController(rootViewController: loginViewController)
                self.window?.rootViewController = navigationCotroller
            }
        }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

