//
//  ContactAddViewController.swift
//  Contacts
//
//  Created by 侯仁杰 on 16/5/25.
//  Copyright © 2016年 侯仁杰. All rights reserved.
//

import UIKit

// 类型重定义
typealias Back = () -> Void
// 其中 () ->Void 是旧类型, Back给旧类型重新起的名字

class ContactAddViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var phoneTextField: UITextField!
    
    @IBOutlet var sexTextField: UITextField!
    
    @IBOutlet var ageTextField: UITextField!
    
    // 声明一个闭包变量属性
    var block: Back?
    
    
    @IBAction func save(sender: AnyObject) {
        
        // 1.将填写的数据封装成ContactModel对象
        let contact = ContactModel(name: nameTextField.text!, phone: phoneTextField.text!, sex: sexTextField.text!, age: ageTextField.text!)
        // 保存数据
        DataHelper.shareInstance.addContact(contact)
        // 调用闭包(让界面进行表示图刷新)
        block!()
        // 返回到列表界面
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // 键盘回收
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        sexTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
