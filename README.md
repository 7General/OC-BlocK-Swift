## Object-c的block和Swift的闭包的对比

>本来来说说在OC和Swift的block和闭包的区别和使用
> 主要以对比的形式写出。

### Object-c申明一个在函数中使用Block且不带参数和没返回值的block
```objc
// ****1：在函数中使用Block不带参数和没返回值的block
-(void)AFNetWork:(NSString *)name withComplated:(void(^)())complated {
    NSLog(@"----函数中打印-%@",name);
    if (complated) {
        complated();
    }
}

// ********调用函数
[self AFNetWork:@"ZZ" withComplated:^{
   NSLog(@"----Block--打印");
}];
```


### Swift 声明不带参数和没返回值的闭包
```Swift
// 声明不带参数和没返回值的闭包
func HttpTools(names: Int ,complated:() -> ()) -> Int {
    let resInt = names + 10
    print("1：先执行函数")
    complated()
    return resInt
}

// ********调用
HttpTools(15) { 
    print("2：在执行Block了")
}
```


#### Object-C 声明带参数和有返回值的Block在函数名中
```objc
// ***2:声明带参数和有返回值的Block在函数名中
-(void)AFNetWork:(NSString *)name withComplatedRetunStr:(NSString *(^)(NSString * names,NSString * school))complated {
    NSLog(@"----函数中打印带参数有返回值-%@",name);
    if (complated) {
        complated(name,@"军事博物馆");
    }
}

// ********调用
[self AFNetWork:@"中国" withComplatedRetunStr:^NSString *(NSString *names,NSString * school) {
    NSLog(@"----Block函数中打印带参数有返回值-%@-----%@",names,school);
    return names;
}];
```
#### Swift 声明带参数和有返回值的闭包在函数名中
```swift
// 声明带参数和有返回值的闭包在函数名中
func ajaxTools(name:String ,complated:(runStr: String,isStop:Bool) -> String) -> String {
    let resStr = name + "覆水难收"
    complated(runStr: resStr, isStop: true)
    return resStr + " - 内部函数返回"
}

// ********调用
let ajaxResult = ajaxTools("洲洲哥") { (runStr, isStop) -> String in
    print("-----\(runStr)")
    return ""
}
```

#### ******Object-C里子页面给父页面传值******
# 工程目录

![OC-Block.png](http://upload-images.jianshu.io/upload_images/1416781-99ad6094876d9274.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

在SecondViewController.h文件中 申明一个Block
```objc
typedef void(^changUserName)(NSString * userNames);
```
把Block申明成属性
```objc
@property (nonatomic, copy) changUserName  changText;
// 还可把set方法抛出来（或者使用实例方法调用）
-(void)setChangText:(changUserName)changText;
```
点击返回按钮的回调方法我们要这样写
```objc
-(void)playVideoBack {
    if (self.changText) {
        self.changText(self.inputFiled.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
```
#### **在跳转按钮的方法里我们这样写（两种方法，对不两种不同属性哦）
```objc
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
```

#### ******Swift里子页面给父页面传值******
#工程目录

![swift-闭包.png](http://upload-images.jianshu.io/upload_images/1416781-f984c6ee1648fa47.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
在SecondViewController.swift文件中 申明一个闭包
```swift
typealias changUserName = (String) ->()
```
把闭包申明成属性
```swift
var changText: changUserName?

// 或者使用实例方法调用（方法名字不固定，但参数是必须的）
func setMyChangeName(tempClose: changUserName)  {
    self.changText = tempClose
}
```
点击返回按钮的回调方法我们要这样写
```swift
func pushClick()  {
    changText!(self.changName.text!)
    
    self.navigationController?.popViewControllerAnimated(true)
}
```
####  **在跳转按钮的方法里我们这样写（两种方法，对不两种不同属性哦）
```swift
 func ClickAction() {
    let secondVC = SecondViewController()
    // 防止循环引用
    weak var WeakSelf = self
    // 第一用方法
    secondVC.changText = { (names) -> () in
    print("------\(names)")
    WeakSelf!.userNames!.text = names
    }
        // 第二用方法
//        secondVC.setMyChangeName { (names) in
//            print("------\(names)")
//            WeakSelf!.userNames!.text = names
//        }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
```


## 更多消息
 更多信iOS开发信息 请以关注洲洲哥 的微信公众号，不定期有干货推送：
 
 ![这里写图片描述](http://upload-images.jianshu.io/upload_images/1416781-0f0cc08cfd424a54?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
