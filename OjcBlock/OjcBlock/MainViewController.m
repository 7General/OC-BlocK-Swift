//
//  MainViewController.m
//  OjcBlock
//
//  Created by 王会洲 on 16/8/5.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@property (nonatomic, weak) UITextField * userNames;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"oc-Block";
    
    
//    [self AFNetWork:@"ZZ" withComplated:^{
//        NSLog(@"----Block--打印");
//    }];
    
    
//    [self AFNetWork:@"中国" withComplatedRetunStr:^NSString *(NSString *names,NSString * school) {
//        NSLog(@"----Block函数中打印带参数有返回值-%@-----%@",names,school);
//        return names;
//    }];
    
    
    UIButton * pusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pusButton.frame = CGRectMake(100, 100, 100, 50);
    pusButton.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pusButton];
    [pusButton addTarget:self action:@selector(ButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UITextField * userNames = [[UITextField alloc] initWithFrame:CGRectMake(100, 170, 200, 50)];
    userNames.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:userNames];
    self.userNames = userNames;
    
}
-(void)ButtonClick {
    SecondViewController * sec = [[SecondViewController alloc] init];
    /**防止循环引用*/
    __weak typeof(self) WeakSelf = self;
// 第一种写法
//    sec.changText = ^(NSString * textStr) {
//        WeakSelf.userNames.text = textStr;
//        [WeakSelf AFNetWork:@"历史遗留痕迹" withComplated:^{
//            NSLog(@"----block---弱引用");
//        }];
//    };
// 第二种写法
    [sec setChangText:^(NSString *userNames) {
        WeakSelf.userNames.text = userNames;
                [WeakSelf AFNetWork:@"历史遗留痕迹" withComplated:^{
                    NSLog(@"----block---弱引用");
                }];
    }];
    
    [self.navigationController pushViewController:sec animated:YES];
}






// ****1：在函数中使用Block不带参数和没返回值的block
-(void)AFNetWork:(NSString *)name withComplated:(void(^)())complated {
    NSLog(@"----函数中打印-%@",name);
    if (complated) {
        complated();
    }
}

// ***2:声明带参数和有返回值的Block在函数名中
-(void)AFNetWork:(NSString *)name withComplatedRetunStr:(NSString *(^)(NSString * names,NSString * school))complated {
    NSLog(@"----函数中打印带参数有返回值-%@",name);
    if (complated) {
        complated(name,@"军事博物馆");
    }
}


@end
