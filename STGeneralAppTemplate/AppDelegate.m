//
//  AppDelegate.m
//  STGeneralAppTemplate
//
//  Created by Liao Jiue-Ren on 26/11/2017.
//  Copyright © 2017 Liao Jiue-Ren. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

/*
 [self.window makeKeyAndVisible];
 
 NSMutableArray *tabItems = [[NSMutableArray alloc] initWithCapacity:2];
 
 DefaultViewController *dvc = [[DefaultViewController alloc] init];
 UINavigationController *dvc_nc = [[UINavigationController alloc] initWithRootViewController:dvc];
 dvc_nc.tabBarItem.title = @"Default";
 dvc_nc.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"]];
 [tabItems addObject:dvc_nc];
 [dvc release];
 [dvc_nc release];
 
 OptionsViewController *ovc = [[OptionsViewController alloc] initWithStyle:UITableViewStyleGrouped];
 UINavigationController *ovc_nc = [[UINavigationController alloc] initWithRootViewController:ovc];
 ovc_nc.tabBarItem.title = @"Option"
 ovc_nc.tabBarItem.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Optiomn" ofType:@"png"]];
 
 [tabItems addObject:ovc_nc];
 [ovc release];
 [ovc_nc release];
 
 UITabBarController *tbc = [[UITabBarController alloc] init];
 tbc.viewControllers = tabItems;
 self.tabController = tbc;
 [tabItems release];
 [tbc release];
 
 [self.window addSubview:self.tabController.view];
 
 return YES;
 */
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self.window makeKeyWindow];
    NSMutableArray * tabItems = [[NSMutableArray alloc] initWithCapacity:2];
    MainViewController * mainViewCtrl = [[MainViewController alloc]init];
    mainViewCtrl.view.backgroundColor = [UIColor whiteColor];
    
    //mainViewCtrl.title = @"Main";
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mainViewCtrl];
    nav.delegate = mainViewCtrl;
    //nav.tabBarItem.title = @"First";
    //nav.navigationItem.title = @"Main";
//    [mainViewCtrl.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"China_Airlines"]  forBarMetrics:UIBarMetricsCompactPrompt];
    mainViewCtrl.titleImgView = [[UIImageView alloc]init];
    mainViewCtrl.titleImgView.frame = CGRectMake(125, 20, 150, 40);
    mainViewCtrl.titleImgView.center = CGPointMake(mainViewCtrl.navigationController.navigationBar.frame.size.width/2, mainViewCtrl.navigationController.navigationBar.frame.size.height/2 + 16);
    [mainViewCtrl.titleImgView setImage:[UIImage imageNamed:@"China_Airlines"]];
    [mainViewCtrl.navigationController.view addSubview:mainViewCtrl.titleImgView];
    //[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"China_Airlines" ofType:@"png"]];
    //[nav.navigationBar setTintColor:[UIColor blackColor]];
//    [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    [tabItems addObject:nav];
    
    SecondViewController * optionViewCtrl = [[SecondViewController alloc]init];
    optionViewCtrl.title = @"More";
    UINavigationController * optNav = [[UINavigationController alloc]initWithRootViewController:optionViewCtrl];
    optNav.tabBarItem.title = @"Second";
    optionViewCtrl.navigationController.navigationItem.title = @"Second Nav";
    optionViewCtrl.navigationController.navigationBar.backgroundColor = [UIColor lightGrayColor];
    [optNav.navigationBar setTintColor:[UIColor blackColor]];
    [tabItems addObject:optNav];
    
    
    UITabBarController * tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = tabItems;
    
    UINavigationController * rootNav = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    rootNav.navigationItem.title = @"Main";
#pragma mark -- deal with slide menu
    LeftViewController * leftVC = [[LeftViewController alloc]init];
    RightViewController * rightVC = [[RightViewController alloc]init];
    
    XLSlideMenu * slideMenu = [[XLSlideMenu alloc]initWithRootViewController:tabBarController];
    slideMenu.delegate = mainViewCtrl;
    slideMenu.leftViewController = leftVC;
    slideMenu.rightViewController = rightVC;
#pragma mark -- deal with root tabBarController
    [self.window setRootViewController:slideMenu];
    UIViewController * topController = [self topViewController:slideMenu];
    NSLog(@"The current top most uiviewcontroller is %@",[topController class]);
    NSLog(@"The number of viewcontrollers of topcontroller is %i",(int)topController.childViewControllers.count);
    int num =(int)topController.childViewControllers.count;
    for(int idx = 0 ; idx < num ; idx++){
        NSLog(@"This is %i viewcontroller, it is %@",idx,[topController.childViewControllers[idx] class]);
    }
    self.window.backgroundColor = [UIColor clearColor];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark --- utility function finding topmost viewcontroller

- (UIViewController *)topViewController{
    return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController *)topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

#pragma mark end --- utility function finding topmost viewcontroller



@end
