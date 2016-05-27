//
//  DataHelper.swift
//  Contacts
//
//  Created by 侯仁杰 on 16/5/27.
//  Copyright © 2016年 侯仁杰. All rights reserved.
//

import UIKit

class DataHelper: NSObject {

    // 创建一个单例对象
    static let shareInstance: DataHelper = DataHelper()
    
    // 声明一个数组属性，用来存放所有联系人
    var modelsArray = Array<ContactModel>()
    
    // 声明数据处理的方法
    // 1.向数组中添加联系人
    func addContact(contactModel: ContactModel) -> Void {
        modelsArray.append(contactModel)
    }
    // 2.从数组中移除一个联系人
    func deleteContactWithIndexPath(indexpath: NSIndexPath) -> Void {
        modelsArray.removeAtIndex(indexpath.row)
    }
    // 3.获取多少个联系人
    func countOfModels() -> Int {
        return modelsArray.count
    }
    // 4.根据indexPath获取某个联系人
    func getContactWithIndexPath(indexPath: NSIndexPath) -> ContactModel {
        return modelsArray[indexPath.row]
    }
    // 5.根据fromIndexPath, 和toIndexPath,实现数组中的元素的移动
    func moveContact(fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) -> Void {
        let contact = modelsArray[fromIndexPath.row]
        modelsArray.removeAtIndex(fromIndexPath.row)
        modelsArray.insert(contact, atIndex: toIndexPath.row)
    }
}
