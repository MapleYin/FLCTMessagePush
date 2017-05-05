//
//  BaseTabBarController.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/5/4.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabBarViewControllers:[UIViewController] = [];
        
        // message
        tabBarViewControllers.append(addViewController(MessageListController(), title: "信息", image: #imageLiteral(resourceName: "bar_msg_icon"), selectedImage: #imageLiteral(resourceName: "bar_msg_icon")));
        
        // call
        tabBarViewControllers.append(addViewController(PhoneCallListController(), title: "电话", image: #imageLiteral(resourceName: "bar_call_icon"), selectedImage: #imageLiteral(resourceName: "bar_call_icon")));
        
        // setting
        tabBarViewControllers.append(addViewController(SettingViewController(), title: "设置", image: #imageLiteral(resourceName: "bar_setting_icon"), selectedImage: #imageLiteral(resourceName: "bar_setting_icon")));
        
        
        self.viewControllers = tabBarViewControllers;
        
        
    }
    
    private func addViewController(_ viewController:UIViewController, title:String, image:UIImage, selectedImage:UIImage)->UIViewController{
        viewController.tabBarItem.title = title;
        viewController.tabBarItem.image = image;
        viewController.tabBarItem.selectedImage = image;
        return NavigationController(rootViewController: viewController);
    }
}
