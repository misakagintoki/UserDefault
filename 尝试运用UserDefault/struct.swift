//
//  struct.swift
//  尝试运用UserDefault
//
//  Created by USER on 2019/02/20.
//  Copyright © 2019 ZZL. All rights reserved.
//

import Foundation




//建立struct包含属性列表，init方法，info元祖，则提取数据时可直接全部提取出来
//struct UserInfo {
//    var name:String
//    var imageName:String
//    var sex:Bool
//    var birth:String
//    var phoneNum:String
//    var address:String
//
//    init(name:String,imageName:String,sex:Bool,birth:String,phoneNum:String,address:String) {
//        self.name = name
//        self.imageName = imageName
//        self.sex = sex
//        self.birth = birth
//        self.phoneNum = phoneNum
//        self.address = address
//    }
//
//    var info:(name:String,imageName:String,sex:Bool,birth:String,phoneNum:String,address:String){
//        return (name,imageName,sex,birth,phoneNum,address)
//    }
//}

let UDStandrad = UserDefaults.standard

//建立struct包含各种key的名字
struct UDKeys {
    var UDName = "Name"
    var UDAge = "Age"
    var UDSex = "Sex"
    var UDBirth = "Birth"
    var UDPhoneNum = "PhoneNum"
    var UDAddress = "Address"
//    var UDIsLogin = "IsLogIn"
}
