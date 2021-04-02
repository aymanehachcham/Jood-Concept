//
//  AppTabBarController.swift
//  JoodTAG
//
//  Created by aymane hachcham on 2/4/2021.
//

import Foundation
import UIKit

class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTabBar()
        
        self.tabBar.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 0.1)
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        self.tabBar.isTranslucent = true
    }
    
    func initTabBar() {
        
        self.view.backgroundColor = .white
        
        // Initialize the navigationViewControllers ot be called
        let homeController = HomeViewController()
        let newsController = NewsViewController()
        let postController = PostViewController()
        let messagesController =  MessagesViewController()
        
        homeController.title = "Home"
        homeController.tabBarItem.image = UIImage(named: "home2")?.resized(newSize: CGSize(width: 25, height: 25))
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -6, right: 0)
        
        newsController.title = "News"
        newsController.tabBarItem.image = UIImage(named: "news")?.resized(newSize: CGSize(width: 25, height: 25))
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -6, right: 0)
        
        postController.title = "Post"
        postController.tabBarItem.image = UIImage(named: "post")?.resized(newSize: CGSize(width: 25, height: 25))
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -6, right: 0)
        
        messagesController.title = "Messages"
        messagesController.tabBarItem.image = UIImage(named: "messages")?.resized(newSize: CGSize(width: 25, height: 25))
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -6, right: 0)
        
        let navigationFont = UIFont(name: "Avenir", size: 20)
        let navigation = UINavigationBar.appearance()
        
        navigation.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: navigationFont!]
        self.setViewControllers([homeController, newsController, postController, messagesController], animated: true)
        self.modalPresentationStyle = .fullScreen
    }
        
        
        
}
