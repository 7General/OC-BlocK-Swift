//
//  SecondViewController.h
//  OjcBlock
//
//  Created by 王会洲 on 16/8/5.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^changUserName)(NSString * userNames);

@interface SecondViewController : UIViewController


@property (nonatomic, copy) changUserName  changText;

-(void)setChangText:(changUserName)changText;

@end
