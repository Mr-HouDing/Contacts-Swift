//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by 侯仁杰 on 16/5/27.
//  Copyright © 2016年 侯仁杰. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    // 声明属性
    var nameLabel: UILabel?
    var phoneLabel: UILabel?
    var sexLabel: UILabel?
    var ageLabel: UILabel?
    // 声明一个计算属性
    var contact: ContactModel? {
        didSet {   // 会自动给你创建一个newValue作为setter方法和参数,用来接受外界传过来的对象
            print(contact?.age)
            self.nameLabel!.text = contact?.name
            print(self.nameLabel?.text)
            self.phoneLabel!.text = contact?.phone
            self.sexLabel!.text = contact?.sex
            self.ageLabel!.text = contact?.age
        }
    }
    
    // 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let name = UILabel(frame: CGRectZero)
        nameLabel = name
        self.addSubview(nameLabel!)
        let phone = UILabel(frame: CGRectZero)
        phoneLabel = phone
        self.addSubview(phoneLabel!)
        let sex = UILabel(frame: CGRectZero)
        sexLabel = sex
        self.addSubview(sexLabel!)
        let age = UILabel(frame: CGRectZero)
        ageLabel = age
        self.addSubview(ageLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 布局
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel!.frame = CGRectMake(10, 10, 60, self.frame.size.height - 20)
        phoneLabel!.frame = CGRectMake(80, 10, 100, self.frame.size.height - 20)
        sexLabel!.frame = CGRectMake(self.frame.size.width - 70, 10, 30, self.frame.size.height - 20)
        ageLabel!.frame = CGRectMake(self.frame.size.width - 40, 10, 30, self.frame.size.height - 20)
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
