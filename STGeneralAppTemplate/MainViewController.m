//
//  ViewController.m
//  STGeneralAppTemplate
//
//  Created by Liao Jiue-Ren on 26/11/2017.
//  Copyright © 2017 Liao Jiue-Ren. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(instancetype)init{
    self = [super init];
    if(self){
        //do some initialization action
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //左
    UIButton *headerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    headerButton.layer.cornerRadius = headerButton.bounds.size.width/2.0f;
    headerButton.layer.masksToBounds = true;
    [headerButton setImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
    [headerButton addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:headerButton];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)showLeft{
    [self.xl_sldeMenu showLeftViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
