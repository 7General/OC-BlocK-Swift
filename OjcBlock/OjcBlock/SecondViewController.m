//
//  SecondViewController.m
//  OjcBlock
//
//  Created by 王会洲 on 16/8/5.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UITextField * inputFiled;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.inputFiled = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    self.inputFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.inputFiled];
    
    
    
    UIButton * playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(100, 220, 100, 80);
    [playButton setTitle:@"回调" forState:UIControlStateNormal];
    [playButton setBackgroundColor:[UIColor grayColor]];
    [playButton addTarget:self action:@selector(playVideoBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    
}
-(void)playVideoBack {
    if (self.changText) {
        self.changText(self.inputFiled.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)setChangText:(changUserName)changText {
    _changText = [changText copy];
}




@end
