//
//  ViewController.swift
//  QuizX
//
//  Created by jothi-pt5112 on 23/06/22.
//

import UIKit

class ViewController: UITabBarController {
    
    static var userId : Int64? = Int64(UserDefaults.standard.integer(forKey: "Logged UserId"))
    
    let vc1 = UINavigationController(rootViewController: HomeViewController())
    let vc2 = UINavigationController(rootViewController: ActivityViewController())
    let vc3 = UINavigationController(rootViewController: LeaderBoardViewController())
    let vc4 = UINavigationController(rootViewController: ProfileViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setMainTabBarController()
    }
    
    func setMainTabBarController() {
        
//        let vc1 = UINavigationController(rootViewController: HomeViewController())
//        let vc2 = UINavigationController(rootViewController: ActivityViewController())
//        let vc3 = UINavigationController(rootViewController: LeaderBoardViewController())
//        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "list.bullet.circle.fill")
        vc3.tabBarItem.image = UIImage(systemName: "star.circle")
        vc4.tabBarItem.image = UIImage(systemName: "person")
        
        vc1.title = NSLocalizedString("home", comment: "")
        vc2.title = NSLocalizedString("activity_title", comment: "")
        vc3.title = NSLocalizedString("leaderboard_Title", comment: "")
        vc4.title = NSLocalizedString("account", comment: "")
        
        self.tabBar.tintColor = .label
        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.isTranslucent = true
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

