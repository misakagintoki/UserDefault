//
//  InfoViewController.swift
//  尝试运用UserDefault
//
//  Created by USER on 2019/02/20.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var birth: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var address: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userdefault = UserDefaults.standard
        name.text = userdefault.string(forKey: UDKeys().UDName)
        sex.text = userdefault.string(forKey: UDKeys().UDSex)
        birth.text = userdefault.string(forKey: UDKeys().UDBirth)
        phoneNum.text = userdefault.string(forKey: UDKeys().UDPhoneNum)
        address.text = userdefault.string(forKey: UDKeys().UDAddress)
//        let userData = userdefault.object(forKey: "第一位用户") as! userInfo
//        name.text = userData.name
//        imageName.text = userData.imageName
//        sex.text = userData.sex ? "男" :"女"
//        birth.text = userData.birth
//        phoneNum.text = userData.birth
//        address.text = userData.address
        
    }
    
    
    @IBAction func button(_ sender: UIButton) {
    }
    
    
    
    
}
