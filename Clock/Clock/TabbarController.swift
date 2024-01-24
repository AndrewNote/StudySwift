//
//  ViewController.swift
//  Clock
//
//  Created by ChanHyuc on 1/23/24.
//

import UIKit

class TabbarController: UIViewController {
    
    private let tabbarController = UITabBarController()
    private let worldColock = UINavigationController(rootViewController: WorldClockController())
    private let alarm = UINavigationController(rootViewController: AlarmController())
    private let stopwatch = UINavigationController(rootViewController: StopwatchController())
    private let timer = UINavigationController(rootViewController: TimerController())
    
    private let itemName = ["세계 시계", "알람", "스톱워치", "타이머"]
    private let itemImage = ["globe", "alarm.fill", "stopwatch.fill", "timer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTabbar()
        configureTabbarItem()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureTabbar() {
        tabbarController.setViewControllers([worldColock, alarm, stopwatch, timer], animated: true)
        addChild(tabbarController)
        view.addSubview(tabbarController.view)
        tabbarController.didMove(toParent: self)
    }
    
    private func configureTabbarItem() {
        tabbarController.tabBar.tintColor = .systemOrange
        tabbarController.tabBar.unselectedItemTintColor = .white
        for i in 0...3 {
            if let item = tabbarController.tabBar.items {
                item[i].title = itemName[i]
                item[i].image = UIImage(systemName: itemImage[i])
            }
        }
        
    }

}
