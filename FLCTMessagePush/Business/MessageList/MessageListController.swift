//
//  MessageListController.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2017/3/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

import UIKit
import SnapKit


class MessageListController: BaseTableViewController {
    var dataList:Array<MessageModel> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI();
        loadData();
    }
    
    func setupUI() {
        
        self.title = "信息";
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_setting").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(setting));
        
        self.tableView.register(MessageListCell.self, forCellReuseIdentifier: NSStringFromClass(MessageListCell.self))
        self.tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: #selector(refresh), for:.valueChanged)
    }
    
    func setting(_ sender:UIBarButtonItem) {
        let settingController = SettingViewController()
        self.navigationController?.present(UINavigationController(rootViewController: settingController), animated: true, completion:nil)
    }
    
    func loadData() {
        MessageServer.shared.listData { (result) in
            if let list = result?.data{
                self.dataList = list;
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Pull to Fetch
    
    func refresh(_ sender:UIRefreshControl) {
        MessageServer.shared.listData { (result) in
            if let list = result?.data{
                self.dataList = list;
                self.tableView.reloadData()
            }
            sender.endRefreshing()
        }
    }
    
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MessageListCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MessageListCell.self), for: indexPath) as! MessageListCell
        cell.fillWithModel(dataList[indexPath.row])
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell;
    }
}
