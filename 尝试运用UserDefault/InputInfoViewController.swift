//
//  InputInfoViewController.swift
//  尝试运用UserDefault
//
//  Created by USER on 2019/02/20.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

class InputInfoViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var inputNameTexrField: UITextField!
    @IBOutlet weak var imageNameTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
//    var userInfo:UserInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func inputButton(_ sender: UIButton) {
//        UserDefaults.standard.set(true, forKey: UDKeys().UDIsLogin)
        UserDefaults.standard.set(inputNameTexrField.text, forKey: UDKeys().UDName)
        UserDefaults.standard.set(sexTextField.text, forKey: UDKeys().UDSex)
        UserDefaults.standard.set(birthTextField.text, forKey: UDKeys().UDBirth)
        UserDefaults.standard.set(phoneNumTextField.text, forKey: UDKeys().UDPhoneNum)
        UserDefaults.standard.set(addressTextField.text, forKey: UDKeys().UDAddress)
        
        
//        userInfo?.name = inputNameTexrField.text ?? ""
//        userInfo?.imageName = imageNameTextField.text ?? ""
//        userInfo?.sex = (imageNameTextField.text == "1") ? true : false
//        userInfo?.birth = birthTextField.text ?? ""
//        userInfo?.phoneNum = phoneNumTextField.text ?? ""
//        userInfo?.address = addressTextField.text ?? ""
//
//
//        let modelData = NSKeyedArchiver.archivedData(withRootObject: userInfo, requiringSecureCoding: true)
//        UserDefaults.standard.set(model, forKey: "first")
//
//        if let myModel = UserDefaults.standard.object(forKey: "first") as! UserInfo{
//
//        }
        //        let userDefault = UserDefaults.standard
        //        let modelData = NSKeyedArchiver.archivedData(withRootObject: userInfo!)
        //        userDefault.set(modelData, forKey: "第一位用户")
        //
        //        let myModelData = userDefalut.data(forKey: "第一位用户")
        //        let myModel = NSKeyedUnarchiver.unarchiveObject(with: myModelData!) as! UserInfo
        //        print(myModel)
    }
    
    
    
    
    
}
