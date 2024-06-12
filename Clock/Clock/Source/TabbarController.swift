import UIKit

class TabbarController: UIViewController {
    
    private let tabbarController = UITabBarController()
    private let worldClock = UINavigationController(rootViewController: WorldClockController())
    private let alarm = UINavigationController(rootViewController: AlarmController())
    private let stopwatch = UINavigationController(rootViewController: StopWatchController())
    private let timer = UINavigationController(rootViewController: TimerController())
    
    private let itemName = ["세계 시계", "알람", "스톱워치", "타이머"]
    private let itemImage = ["globe", "alarm.fill", "stopwatch.fill", "timer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbar()
        configureTabbarItem()
        tabbarController.selectedIndex = 1
    }
    
    private func configureTabbar() {
        tabbarController.setViewControllers([worldClock, alarm, stopwatch, timer], animated: true)
        addChild(tabbarController)
        view.addSubview(tabbarController.view)
        tabbarController.didMove(toParent: self)
    }
    
    private func configureTabbarItem() {
        tabbarController.tabBar.unselectedItemTintColor = .white
        
        tabbarController.tabBar.items?.enumerated().forEach { index, item in
            item.title = itemName[index]
            item.image = UIImage(systemName: itemImage[index])
        }
    }

}
