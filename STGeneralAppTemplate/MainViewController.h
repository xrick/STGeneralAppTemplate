//
//  ViewController.h
//  STGeneralAppTemplate
//
//  Created by Liao Jiue-Ren on 26/11/2017.
//  Copyright © 2017 Liao Jiue-Ren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLSlideMenu.h"
@interface MainViewController : UIViewController<SlideMenuButtonTapDelegate>
{
    
}
@property(nonatomic,strong)UIImageView * titleImgView;

-(instancetype)init;


@end

