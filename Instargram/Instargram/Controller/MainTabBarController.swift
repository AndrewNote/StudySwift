//
//  MainViewController.swift
//  Instargram
//
//  Created by Andrew on 2023/06/26.
//

import UIKit

class MainTabBarController: UITabBarController {
    // MARK: Properties
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTabBarUI()
    }
    
    // MARK: Method
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    
    private func configureTabBarUI() {
        let feed = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "homeUnSeleted"), seletedImage: #imageLiteral(resourceName: "homeSeleted"), rootViewController: FeedController())
        let search = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "searchUnSeleted"), seletedImage: #imageLiteral(resourceName: "searchSeleted"), rootViewController: SearchController())
        let imageSeleted = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "addUnSeleted"), seletedImage: #imageLiteral(resourceName: "addSeleted"), rootViewController: ImageSelectorController())
        let notification = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "heartUnSeleted"), seletedImage: #imageLiteral(resourceName: "heartSeleted"), rootViewController: NotificationController())
        let profile = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "userUnSeleted"), seletedImage: #imageLiteral(resourceName: "userSeleted"), rootViewController: ProfileController())
    
        viewControllers = [feed, search, imageSeleted, notification, profile]
        tabBar.tintColor = .black
    }
    
    private func setTabBarItem(unSeletedImage: UIImage, seletedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        
        let item = UINavigationController(rootViewController: rootViewController)
        item.tabBarItem.image = unSeletedImage
        item.tabBarItem.selectedImage = seletedImage
        item.navigationBar.tintColor = .black
        return item
    }
    
}
