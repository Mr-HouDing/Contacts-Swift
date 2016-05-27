//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by 侯仁杰 on 16/5/25.
//  Copyright © 2016年 侯仁杰. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var phoneLabel: UILabel!
    
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var sexLabel: UILabel!
    
    var contact: ContactModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = contact!.name
        phoneLabel.text = contact!.phone
        sexLabel.text = contact!.sex
        ageLabel.text = contact!.age
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
