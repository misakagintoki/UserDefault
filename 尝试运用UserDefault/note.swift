//
//  note.swift
//  尝试运用UserDefault
//
//  Created by USER on 2019/02/20.
//  Copyright © 2019 ZZL. All rights reserved.
//

import Foundation
/*
 UserDefaults 适合存储轻量级的本地客户端数据，比如记住密码功能，要保存一个系统的用户名、密码。使用 UserDefaults 是首选。下次再登陆的时候就可以直接从 UserDefaults 里面读取上次登陆的信息。
 
 一般来说本地存储数据我们还可以是用 SQlite 数据库，或者使用自己建立的 plist 文件什么的，但这还得自己显示创建文件，读取文件，很麻烦，而是用 UserDefaults 则不用管这些东西，就像读字符串一样，直接读取就可以了。
 
 UserDefaults 支持的数据格式也很多，有：Int，Float，Double，BOOL，Array，Dictionary，甚至 Any 类型。
 
 （1）如果是第一次运行程序通过 CFUUIDCreate 方法生成一个唯一字符串作为用户id储存起来（形如：B8DDB58D-73BF-4E39-A051-365858FC4626）
 （2）往后运行时直接从 UserDefaults 中把用户id取出
 
 
 class ViewController: UIViewController {
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 print("用户uuid：\(get_uuid())")
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 }
 }
 
 func get_uuid() -> String{
 let userid = UserDefaults.standard.string(forKey: "hangge")
 //判断UserDefaults中是否已经存在
 if(userid != nil){
 return userid!
 }else{
 //不存在则生成一个新的并保存
 let uuid_ref = CFUUIDCreate(nil)
 let uuid_string_ref = CFUUIDCreateString(nil , uuid_ref)
 let uuid = uuid_string_ref as! String
 UserDefaults.standard.set(uuid, forKey: "hangge")
 return uuid
 }
 }
 
 
 2，对原生数据类型的储存和读取
 let userDefault = UserDefaults.standard
 
 //Any
 userDefault.set("hangge.com", forKey: "Object")
 let objectValue:Any? = userDefault.object(forKey: "Object")
 
 //Int类型
 userDefault.set(12345, forKey: "Int")
 let intValue = userDefault.integer(forKey: "Int")
 
 //Float类型
 userDefault.set(3.2, forKey: "Float")
 let floatValue = userDefault.float(forKey: "Float")
 
 //Double类型
 userDefault.set(5.2240, forKey: "Double")
 let doubleValue = userDefault.double(forKey: "Double")
 
 //Bool类型
 userDefault.set(true, forKey: "Bool")
 let boolValue = userDefault.bool(forKey: "Bool")
 
 //URL类型
 userDefault.set(URL(string:"http://hangge.com")!, forKey: "URL")
 let urlValue = userDefault.url(forKey: "URL")
 
 //String类型
 userDefault.set("hangge.com", forKey: "String")
 let stringValue = userDefault.string(forKey: "String")
 
 //NSNumber类型
 var number = NSNumber(value:22)
 userDefault.set(number, forKey: "NSNumber")
 number = userDefault.object(forKey: "NSNumber") as! NSNumber
 
 //Array类型
 var array:Array = ["123","456"]
 userDefault.set(array, forKey: "Array")
 array = userDefault.array(forKey: "Array") as! [String]
 
 //Dictionary类型
 var dictionary = ["1":"hangge.com"]
 userDefault.set(dictionary, forKey: "Dictionary")
 dictionary = userDefault.dictionary(forKey: "Dictionary") as! [String : String]
 
 3，系统对象的存储与读取
 系统对象实现存储，需要通过 archivedData 方法转换成 Data 为载体，才可以存储。下面以 UILabel 对象为例：
 
 let userDefault = UserDefaults.standard
 
 //UILabel对象存储
 //将对象转换成Data流
 let label = UILabel()
 label.text = "欢迎访问hangge.com"
 let labelData = NSKeyedArchiver.archivedData(withRootObject: label)
 //存储Data对象
 userDefault.set(labelData, forKey: "labelData")
 
 //UILabel对象读取
 //获取Data
 let objData = userDefault.data(forKey: "labelData")
 //还原对象
 let myLabel = NSKeyedUnarchiver.unarchiveObject(with: objData!) as? UILabel
 print(myLabel)
 
 对于 UIImage 对象的存储比较特殊。注意下方高亮部分，如果我们过直接把 image1 存储起来，再取出转换回 UIImage 就变成了 nil。必须先转成 image2 再存储。
 let userDefault = UserDefaults.standard
 
 //UIImage对象存储
 //将对象转换成Data流
 let image1 = UIImage(named: "apple.png")!
 let image2 = UIImage(cgImage: image1.cgImage!, scale: image1.scale,
 orientation: image1.imageOrientation)
 let imageData = NSKeyedArchiver.archivedData(withRootObject: image2)
 //存储Data对象
 userDefault.set(imageData, forKey: "imageData")
 
 //UIImage对象读取
 //获取Data
 let objData = userDefault.data(forKey: "imageData")
 //还原对象
 let myImage = NSKeyedUnarchiver.unarchiveObject(with: objData!) as? UIImage
 print(myImage)
 
 4，自定义对象的存储和读取
 如果想要存储自己定义的类，首先需要对该类实现 NSCoding 协议来进行归档和反归档（序列化和反序列化）。即该类内添加 func encode(with coder: NSCoder) 方法和 init(coder decoder: NSCoder) 方法，将属性进行转换。
 
 let userDefault = UserDefaults.standard
 
 //自定义对象存储
 let model = UserInfo(name: "航歌", phone: "3525")
 //实例对象转换成Data
 let modelData = NSKeyedArchiver.archivedData(withRootObject: model)
 //存储Data对象
 userDefault.set(modelData, forKey: "myModel")
 
 //自定义对象读取
 let myModelData = userDefault.data(forKey: "myModel")
 let myModel = NSKeyedUnarchiver.unarchiveObject(with: myModelData!) as! UserInfo
 print(myModel)
 
 //----- 自定义对象类 -----
 class UserInfo: NSObject, NSCoding {
 var name:String
 var phone:String
 
 //构造方法
 required init(name:String="", phone:String="") {
 self.name = name
 self.phone = phone
 }
 
 //从object解析回来
 required init(coder decoder: NSCoder) {
 self.name = decoder.decodeObject(forKey: "Name") as? String ?? ""
 self.phone = decoder.decodeObject(forKey: "Phone") as? String ?? ""
 }
 
 //编码成object
 func encode(with coder: NSCoder) {
 coder.encode(name, forKey:"Name")
 coder.encode(phone, forKey:"Phone")
 }
 }
 
 5，删除存储对象
 通过 removeObject() 方法可以删除已保存的数据。当然如果这个存储对象不存在也不会报错。
 1
 UserDefaults.standard.removeObject(forKey: "hangge")
 
 
 */
