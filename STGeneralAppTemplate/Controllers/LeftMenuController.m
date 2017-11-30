//
//  LeftMenuController.m
//  XLSlideMenuExample
//
//  Created by MengXianLiang on 2017/5/8.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//  GitHub:https://github.com/mengxianliang/XLSlideMenu

#import "LeftMenuController.h"
#import "XLSlideMenu.h"

@interface LeftMenuController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *_tableView;;
}
@end

@implementation LeftMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"功能選項";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self titles].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self titles][indexPath.row];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:3/255.0f green:102/255.0f blue:214/255.0f alpha:1];
    cell.detailTextLabel.text = [self subTitles][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.xl_sldeMenu showRootViewControllerAnimated:true];
            break;
        case 1:
            //[self.xl_sldeMenu showLeftViewControllerAnimated:true]; //now to show the left slide menu.
            break;
        case 2:
            [self.xl_sldeMenu showRightViewControllerAnimated:true];
            break;
        case 3: {
            [self.xl_sldeMenu showRootViewControllerAnimated:true];
            UIViewController *vc = [[UIViewController alloc] init];
            vc.title = @"New View";
            vc.view.backgroundColor = [UIColor lightGrayColor];
            UINavigationBar * uvb = [[UINavigationBar alloc]init];
            uvb.frame = CGRectMake(0, 0, 375, 22);
            uvb.backgroundColor = [UIColor brownColor];
            [vc.view addSubview:uvb];
            
            //UINavigationController *nav = (UINavigationController *)self.xl_sldeMenu.rootViewController.navigationController;
//            [[UIApplication.sharedApplication delegate].window.rootViewController.navigationController pushViewController:vc animated:true];
            [self.xl_sldeMenu.delegate buttonPressedForPushViewController:vc];
            //[self.xl_sldeMenu.rootViewController.navigationController pushViewController:vc animated:true];
            //[nav pushViewController:vc animated:true];
        }
            break;
        case 4:
            self.xl_sldeMenu.slideEnabled = !self.xl_sldeMenu.slideEnabled;
            [tableView reloadData];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource
- (NSArray *)titles {
    return @[@"隱藏選單",@"展示方格選單",@"連接socket server",@"加入新視圖",@"測試KVO",@"測試Local Notification"];
}

- (NSArray *)subTitles {
    //NSString *subTitle = self.xl_sldeMenu.slideEnabled ? @"(已打開)" : @"(已關閉)" ;
    return @[@"",@"",@"",@"",@"",@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
