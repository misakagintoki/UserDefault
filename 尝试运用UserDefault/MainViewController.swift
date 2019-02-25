//
//  MainViewController.swift
//  尝试运用UserDefault
//
//  Created by USER on 2019/02/20.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //自己摸索怎么把NSString转换成CFStringRef
//    let yourFriendNSString:NSString = "fast"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let yourFriendSFStringRef = IFT_BRIDGE(yourFriendSFStringRef)
        
        print("用户uuid：\(get_uuid())")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func get_uuid() -> String{
        let userid = UserDefaults.standard.string(forKey: "zhanghao")
        if (userid != nil){
            return userid!
        }else{
            let uuid_ref = CFUUIDCreate(nil)
            let uuid_string_ref = CFUUIDCreateString(nil , uuid_ref)
            let uuid = uuid_string_ref! as String
            UserDefaults.standard.set(uuid, forKey: "hangge")
            return uuid
        }
    }
    
}
