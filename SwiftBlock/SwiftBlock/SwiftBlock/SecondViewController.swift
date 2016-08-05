//
//  SecondViewController.swift
//  SwiftBlock
//
//  Created by 王会洲 on 16/8/5.
//  Copyright © 2016年 王会洲. All rights reserved.
//

import UIKit

typealias changUserName = (String) ->()

class SecondViewController: UIViewController {

    var changText: changUserName?
    
    var changName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        InitView()
    }
    
    
    func InitView()  {
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.changName = UITextField(frame: CGRectMake(100,100,100,50))
        self.changName.borderStyle = .RoundedRect
        self.view.addSubview(self.changName)
        
        
        let pusButton: UIButton = UIButton(type: .Custom)
        pusButton.frame = CGRectMake(100, 220, 100, 80)
        pusButton.backgroundColor = UIColor.redColor()
        self.view.addSubview(pusButton)
        pusButton.addTarget(self, action: #selector(pushClick), forControlEvents: .TouchUpInside)
        
    }
    func pushClick()  {
        changText!(self.changName.text!)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    func setMyChangeName(tempClose: changUserName)  {
        self.changText = tempClose
    }
    
    

}
