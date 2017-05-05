//
//  MessageListCell.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class MessageListCell: UITableViewCell {
    
    private var numberLabel:UILabel = UILabel()
    private var dateLabel:UILabel = UILabel()
    private var content:UILabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        numberLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.contentView.addSubview(numberLabel)
        
        dateLabel.font = UIFont.systemFont(ofSize: 18)
        dateLabel.textColor = UIColor(red:0.557, green:0.557, blue:0.576, alpha:1.000)
        self.contentView.addSubview(dateLabel)
        
        content.font = UIFont.systemFont(ofSize: 16)
        content.numberOfLines = 0
        content.textColor = UIColor(red:0.557, green:0.557, blue:0.576, alpha:1.000)
        self.contentView.addSubview(content)
        
        numberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(9)
            make.left.equalTo(self.contentView).offset(10)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10)
            make.top.equalTo(numberLabel)
        }
        
        content.snp.makeConstraints { (make) in
            make.top.equalTo(numberLabel.snp.bottom).offset(5)
            make.left.equalTo(numberLabel)
            make.right.equalTo(dateLabel.snp.right)
            make.bottom.equalTo(self.contentView).offset(-9)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillWithModel(_ model:MessageModel) {
        numberLabel.text = model.form
        dateLabel.text = model.date.smartFormat()
        content.text = model.content
    }

}
