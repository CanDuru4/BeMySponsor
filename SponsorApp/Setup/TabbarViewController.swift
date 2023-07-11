//
//  TabbarViewController.swift
//  SponsorApp
//
//  Created by Can Duru on 20.09.2022.
//

//MARK: Import
import UIKit

class TabBarViewController : UITabBarController {
    
//MARK: Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.backgroundColor = .white
        tabBar.tintColor = .label
        setupVCs()
    }
    
    //MARK: Create ViewControllers
    func setupVCs() {
          viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "house.fill")!.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue)),
              createNavController(for: SearchViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "magnifyingglass")!.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue)),
              createNavController(for: ProfileViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "person.fill")!.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue)),
          ]
      }
    
    //MARK: Set Tabbar Items
    var i = -1
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let items = ["Home", "Search", "Profile"]
          i = i+1
          let navController = UINavigationController(rootViewController: rootViewController)

          navController.tabBarItem.title = items[i]
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = false
          rootViewController.navigationItem.title = title
          return navController
      }
}

