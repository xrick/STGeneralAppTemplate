//
//  ViewController.m
//  STGeneralAppTemplate
//
//  Created by Liao Jiue-Ren on 26/11/2017.
//  Copyright © 2017 Liao Jiue-Ren. All rights reserved.
//

#import "MainViewController.h"
@interface MainViewController ()<UINavigationControllerDelegate>

@end

@implementation MainViewController
@synthesize titleImgView;
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"nac didShowViewController triggered. the viewController is %@",[viewController class]);
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"nac willShowViewController triggered. the viewController is %@",[viewController class]);
    
    if([viewController isKindOfClass:[MainViewController class]] )
    {
        NSLog(@"titleImgView hidden set to false is called!");
        titleImgView.hidden = false;
    }
    else{
        NSLog(@"titleImgView hidden set to true is called!");
        //titleImgView.hidden = true;
    }
    
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

-(void)buttonPressedForPushViewController:(UIViewController *)viewController withActionFlag:(int)actionFlag
{
    switch(actionFlag){
        case 1: // add new viewController
            [self.navigationController pushViewController:viewController animated:true];
            self.titleImgView.hidden = true;
            break;
        case 2: // download test
            [((UITabBarController*)self.parentViewController.parentViewController) setSelectedIndex:1];
            //NSLog(@"The current indexed vc is class :%@",[self.parentViewController.parentViewController class]);
            break;
        default:
            break;
    }
    
    
}

-(instancetype)init{
    self = [super init];
    if(self){
        //do some initialization action
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"Main Window";
#pragma mark --- deal with main ui
//    self.titleImgView = [[UIImageView alloc]init];
//    self.titleImgView.frame = CGRectMake(125, -20, 150, 20);
//    self.titleImgView.center = CGPointMake(self.navigationController.navigationBar.frame.size.width/2, self.navigationController.navigationBar.frame.size.height/2);
//    [self.titleImgView setImage:[UIImage imageNamed:@"China_Airlines"]];
//    [self.navigationController.navigationBar addSubview:titleImgView];
    //左
    UIButton *headerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    headerButton.layer.cornerRadius = headerButton.bounds.size.width/2.0f;
    headerButton.layer.masksToBounds = true;
    [headerButton setImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
    [headerButton addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:headerButton];
    // Do any additional setup after loading the view, typically from a nib.
    //右
    UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [moreButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(showRight) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
    
    [self createButton];
}

-(void)showLeft{
    [self.xl_sldeMenu showLeftViewControllerAnimated:true];
}
-(void)showRight{
    //[self.xl_sldeMenu showRightViewControllerAnimated:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)createButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.layer.borderWidth = 1.5;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    [button addTarget:self
               action:@selector(tapButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Click Me" forState:UIControlStateNormal];
    button.frame = CGRectMake(50.0, 150.0, 160.0, 40.0);
    [self.view addSubview:button];
}

-(void)tapButton:(UIButton*)sender
{
    NSLog(@"Button tapped!");
}

-(void)createTextView
{
    
}



@end
