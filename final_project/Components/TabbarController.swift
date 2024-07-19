//
//  TabbarController.swift
//  final_project
//
//  Created by Nihad on 08.06.24.
//

import UIKit

class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemBackground
        
        
        configureTabbar()
    }

    private func configureTabbar() {
        
        
        let vc1 = HomeViewController()
        let vc2 = TripViewController()
        let vc3 = QRViewController()
        let vc4 = ProfileViewController()
        
        vc1.tabBarItem.image = UIImage(named: "home")
        vc2.tabBarItem.image = UIImage(named: "trip")
        vc3.tabBarItem.image = UIImage(named: "qr")
        vc4.tabBarItem.image = UIImage(named: "user")
        
        vc1.tabBarItem.title = "Home"
        vc2.tabBarItem.title = "Trip"
        vc3.tabBarItem.title = "QR"
        vc4.tabBarItem.title = "Profile"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)

        tabBar.tintColor = ColorStyles.BaseColor.brand
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}
