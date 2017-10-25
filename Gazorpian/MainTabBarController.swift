//
//  MainTabBarController.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/16/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }
            setUpViewControllers()
    }
    func setUpViewControllers() {
        //Home
        let profileNavController = templateNavController(unselected: #imageLiteral(resourceName: "Profile"), selectedImage: #imageLiteral(resourceName: "Profile"), rootViewController: UserProfileController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //Search
        let searchNavController = templateNavController(unselected: #imageLiteral(resourceName: "Search 2"), selectedImage: #imageLiteral(resourceName: "Search 2"), rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //Cam
        let homeNavController = templateNavController(unselected: #imageLiteral(resourceName: "Post Button"), selectedImage: #imageLiteral(resourceName: "Post Button"), rootViewController: camController())
        
        //Messages
        let messagesNavController = templateNavController(unselected: #imageLiteral(resourceName: "Messages"), selectedImage: #imageLiteral(resourceName: "Messages"), rootViewController: MessagesController())
        
        //Jobs
        let jobsNavController = templateNavController(unselected: #imageLiteral(resourceName: "Jobs"), selectedImage: #imageLiteral(resourceName: "Jobs"), rootViewController: JobsController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabBar.tintColor = UIColor.rgb(red: 103, green: 174, blue: 202)
        tabBar.unselectedItemTintColor = UIColor.darkGray

        viewControllers = [searchNavController,
                           messagesNavController,
                           homeNavController,
                           jobsNavController,
                           profileNavController]
        //Modify tab bar items
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    fileprivate func templateNavController(unselected: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
