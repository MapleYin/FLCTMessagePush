//
//  STMPTabBarViewController.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/18.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPTabBarViewController.h"
#import "STMPMessageListController.h"


@interface STMPTabBarViewController ()

@end

@implementation STMPTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Private

- (void)setupTabBar {
    NSMutableArray<UIViewController *> *controllers = [NSMutableArray array];
    
    [controllers addObject:[self createChildController:[STMPMessageListController new] title:@"信息" image:[UIImage imageNamed:@"bar_msg_icon"] selectedImage:[UIImage imageNamed:@"bar_msg_icon"]]];
    self.viewControllers = controllers;
}


#pragma mark - Helper

- (__kindof UIViewController *)createChildController:(__kindof UIViewController *)controller
                                               title:(NSString *)title
                                               image:(UIImage *)image
                                       selectedImage:(UIImage *)selectedImage {
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = image;
    controller.tabBarItem.selectedImage = selectedImage;
    return [[UINavigationController alloc] initWithRootViewController:controller];
}

@end
