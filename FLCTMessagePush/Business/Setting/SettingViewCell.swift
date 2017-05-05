//
//  SettingViewCell.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/4/2.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit

class SettingViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fillWithModel(_ model:SettingModel) {
        self.textLabel?.text = model.title
    }
}
