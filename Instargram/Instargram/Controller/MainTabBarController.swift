//
//  MainViewController.swift
//  Instargram
//
//  Created by Andrew on 2023/06/26.
//

import UIKit

class MainTabBarController: UITabBarController {
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarUI()
    }
    
    // MARK: Method
    private func configureTabBarUI() {
        let feed = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "homeUnSeleted"), seletedImage: #imageLiteral(resourceName: "homeSeleted"), rootViewController: FeedController())
        let search = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "searchUnSeleted"), seletedImage: #imageLiteral(resourceName: "searchSeleted"), rootViewController: SearchController())
        let imageSeleted = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "addUnSeleted"), seletedImage: #imageLiteral(resourceName: "addSeleted"), rootViewController: ImageSelectorController())
        let reels = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "playUnSeleted"), seletedImage: #imageLiteral(resourceName: "playSeleted"), rootViewController: ReelsController())
        let profile = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "userUnSeleted"), seletedImage: #imageLiteral(resourceName: "userSeleted"), rootViewController: ProfileController())
        
        viewControllers = [feed, search, imageSeleted, reels, profile]
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
