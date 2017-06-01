//
//  SettingViewController.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/4/1.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit
import NetworkExtension

class SettingViewController: BaseTableViewController {
    var dataList:Array<SettingModel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("setting", comment: "setting title")
        
        createSettingItems()

        self.tableView = UITableView(frame: CGRect(), style: .grouped)
        self.tableView.register(SettingViewCell.self, forCellReuseIdentifier: NSStringFromClass(SettingViewCell.self))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    func createSettingItems(){
        self.dataList.append(SettingModel("点击登录"))
        self.dataList.append(SettingModel("推送设置"))
        self.dataList.append(SettingModel("本地推送"))
    }
    
    func close(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SettingViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SettingViewCell.self), for: indexPath) as! SettingViewCell
        cell.fillWithModel(dataList[indexPath.row])
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell;
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let loginVC = UINavigationController(rootViewController: LoginController())
            self.navigationController?.present(loginVC, animated: true, completion: nil)
        default:
            break
        }
    }

}
