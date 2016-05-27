//
//  ContactModel.swift
//  Contacts
//
//  Created by 侯仁杰 on 16/5/27.
//  Copyright © 2016年 侯仁杰. All rights reserved.
//

import UIKit

class ContactModel: NSObject {

    // 声明对象属性
    var name: String?
    var phone: String?
    var sex: String?
    var age: String?
    
    // 构造方法
    init(name: String, phone: String, sex: String, age: String) {
        self.name = name
        self.phone = phone
        self.sex = sex
        self.age = age
    }
}
