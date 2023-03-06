//
//  MainTabbarViewController.swift
//  tibia
//
//  Created by allexis figueiredo on 05/03/23.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: WorldsViewController())
        let vc3 = UINavigationController(rootViewController: FriendListViewController())
        let vc4 = UINavigationController(rootViewController: SearchViewController())
        
        let vcs = [vc1, vc2, vc3, vc4]
        
        vcs.forEach { vc in
            vc.navigationBar.prefersLargeTitles = true
        }
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc1.title = Constants.Strings.News
        
        vc2.tabBarItem.image = UIImage(systemName: "network")
        vc2.title = Constants.Strings.Worlds
        
        vc3.tabBarItem.image = UIImage(systemName: "person.2")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "person.2.fill")
        vc3.title = Constants.Strings.Friendlist
        
        vc4.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.title = Constants.Strings.Search
        
        setViewControllers(vcs, animated: true)
    }


}

