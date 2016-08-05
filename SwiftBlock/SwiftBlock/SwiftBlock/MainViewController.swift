//
//  MainViewController.swift
//  SwiftBlock
//
//  Created by 王会洲 on 16/8/5.
//  Copyright © 2016年 王会洲. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var userNames: UITextField!;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化界面
        initView()
        
    }

    func initView() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.userNames = UITextField(frame: CGRectMake(100,170,200,50))
        self.userNames.borderStyle = .RoundedRect
        self.view.addSubview(self.userNames)
        
        
        let buttn: UIButton =  UIButton(type: .Custom)
        buttn.frame = CGRectMake(100, 100, 100, 50)
        buttn.backgroundColor = UIColor.redColor()
        self.view.addSubview(buttn)
        buttn.addTarget(self, action: #selector(ClickAction), forControlEvents: .TouchUpInside)
    }
    
    
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
    
    
    
    

}
