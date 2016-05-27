//
//  ContactListTableViewController.swift
//  Contacts
//
//  Created by 侯仁杰 on 16/5/25.
//  Copyright © 2016年 侯仁杰. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置NavigationItem
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(ContactListTableViewController.Add))
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        // 注册cell
        self.tableView.registerClass(ContactTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // Item事件
    func Add() -> Void {
        let addVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddVC") as! ContactAddViewController
        
        // 闭包的实现部分
        addVC.block = {
            Back in self.tableView.reloadData()
        }
        
        self.navigationController?.presentViewController(addVC, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataHelper.shareInstance.countOfModels()
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ContactTableViewCell
        // 获取某个联系人对象
        let contact: ContactModel = DataHelper.shareInstance.getContactWithIndexPath(indexPath)
        
        cell.contact = contact
        print(cell.contact?.name)
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! ContactDetailViewController
        
        // 根据indexPath获取contact对象
        let contact = DataHelper.shareInstance.getContactWithIndexPath(indexPath)
        
        // 属性传值
        detailVC.contact = contact
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            // 删除数据
            DataHelper.shareInstance.deleteContactWithIndexPath(indexPath)
            // 删除UI
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let action1 = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "删除") { (action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            // 删除数据
            DataHelper.shareInstance.deleteContactWithIndexPath(indexPath)
            // 删除UI
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        let action2 = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "标记为已读") { (action: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
            print("点击了<标记为已读>按钮")
        }
        
        return [action1, action2]
    }
    
 
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        DataHelper.shareInstance.moveContact(fromIndexPath, toIndexPath: toIndexPath)
        
    }
 

  
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
