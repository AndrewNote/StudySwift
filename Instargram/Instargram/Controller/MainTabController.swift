//
//  MainTabController.swift
//  Instargram
//
//  Created by Andrew on 2023/01/18.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    func configureViewControllers() {
        let feed = FeedController()     // 상수에 뷰 컨트롤러의 인스턴스를 저장 하는것
        let search = SearchController()
        let imageSelector = ImageSelectorController()
        let notifications = NotificationController()
        let profile = ProfileController()
        
        // viewControllers가 tabBarController를 상속해서 얻는기능이라고 한다.
        // 인스턴스를 바로 넣을 수 있지만 ex) FeedController() 일단 비추 한다고 한다.
        viewControllers = [feed, search, imageSelector, notifications, profile]
    }
    
    
}
