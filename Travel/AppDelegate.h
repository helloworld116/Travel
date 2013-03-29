//
//  AppDelegate.h
//  Travel
//
//  Created by apple on 13-3-20.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Reachability;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
}

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UINavigationController *centerController;
@property (retain, nonatomic) UIViewController *leftController;
@property (retain, nonatomic) UIViewController *rightController;

@end
