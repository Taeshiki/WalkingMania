//
//  CustomTabBarController.swift
//  WalkingMania
//
//  Created by 요시킴 on 2023/12/06.
//

import UIKit

class CustomTabBarController: UITabBarController {

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        self.setupTabBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.backgroundColor = .clear
        self.setupItems()
    }

    // MARK: - Helpers

    func setupTabBar() {
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 180
    }

    private func setupItems() {
        let mainPageVC = MainPageViewController()
        mainPageVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "square.on.square"), tag: 0)

        let surroundingWalkVC = SurroundingWalkViewController()
        surroundingWalkVC.tabBarItem = UITabBarItem(title: "주변 탐색", image: UIImage(systemName: "figure.walk"), tag: 1)

        let myPageVC = MyPageViewController()
        myPageVC.tabBarItem = UITabBarItem(title: "마이 페이지", image: UIImage(systemName: "person.fill"), tag: 2)

        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray

        let controllers = [mainPageVC, surroundingWalkVC, myPageVC]
        viewControllers = controllers.map { DynamicStatusBarNavigation(rootViewController: $0) }
    }
}

// MARK: - UITabBarControllerDelegate

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let fromView = selectedViewController?.view
        let toView = viewController.view

        if fromView != toView {
            UIView.transition(from: fromView!, to: toView!, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }

        return true
    }
}

// MARK: - Status Bar Custom Setting

open class DynamicStatusBarNavigation: UINavigationController {
    override open var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}

