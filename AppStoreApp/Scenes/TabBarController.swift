//
//  TabBarController.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/26.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - UIViewControllers
    //lazy var : 첨에는 nil. 사용될시점에 메모리에 로드됨. (효율성)
    private lazy var todayViewController: UICollectionViewController = {
        let layout = UICollectionViewFlowLayout()
        let viewController = TodayViewController(collectionViewLayout: layout)
        let tabBarItem = UITabBarItem(
            title: "투데이",
            image: UIImage(systemName: "mail"),
            tag: 0
        )
        viewController.tabBarItem = tabBarItem
        print("todayViewController 호출됨.")
        return viewController
    }()

//    Why don't do like this?
//    private lazy var nextViewController: UIViewController = UIViewController()
//    cause to make tabBarItem. in closure.
    
//    for test
    private lazy var appViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController())
        let tabBarItem = UITabBarItem(
            title: "앱",
            image: UIImage(systemName: "square.stack.3d.up"),
            tag: 1
        )
        viewController.tabBarItem = tabBarItem
        print("appViewController 호출됨.")
        return viewController
    }()
    
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TabBarController 로드됨.")
        
        view.backgroundColor = .systemBackground
        
        viewControllers = [todayViewController, appViewController]
    }
}
