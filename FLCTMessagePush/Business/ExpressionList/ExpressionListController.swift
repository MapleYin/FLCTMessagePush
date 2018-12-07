//
//  ExpressionListController.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/16.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit
import MessageCommon

class ExpressionListController: ASViewController<ASTableNode> {
    
    let tableNode: ASTableNode
    let filterExpressionMananger = FilterExpressionManager()
    var currentEditModel: ExpressionEditModel?
    
    init() {
        self.tableNode = ASTableNode(style: .plain)
        super.init(node: tableNode)
        self.tableNode.allowsMultipleSelectionDuringEditing = true
        
        self.title = "过滤规则"
        
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "编辑", style: .plain, target: self, action: #selector(editAction))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExpressionAction))
        
        
        
        let selectAll = UIBarButtonItem(title: "全部选择", style: .plain, target: self, action: #selector(selectAllAction))
        
        let delete = UIBarButtonItem(title: "删除", style: .plain, target: self, action: #selector(deleteAction))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.setToolbarItems([selectAll, space, delete], animated: false)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let editModel = self.currentEditModel {
            
        }
    }
}

// MARK: - Method
extension ExpressionListController {
    func createExpression() {
        let juniorModeNode = ExpressionEditJuniorModeNode()
        let editModel = ExpressionEditModel()
        let vc = ExpressionEditController(editNode: juniorModeNode, editModel: editModel)
        let nav = ASNavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
        self.currentEditModel = editModel
    }
    
    func editList(isEditing: Bool) {
        // table view stauts
        self.tableNode.view.setEditing(isEditing, animated: true)
        
        // toolbar
        self.updateToolBarStatus(isEditing)
        
        // navigation item
        self.updateNavigationItem(isEditing)
    }
    
    func updateNavigationItem(_ isEditing: Bool) {
        let titleText: String
        if isEditing {
            titleText = "取消"
        } else {
            titleText = "编辑"
        }

        self.navigationItem.leftBarButtonItem?.title = titleText
    }
    
    func updateToolBarStatus(_ isEditing: Bool) {
        self.navigationController?.setToolbarHidden(!isEditing, animated: true)
        self.itemSelectedStatusDidChanged(at: nil, selected: nil)
    }
    
    func itemSelectedStatusDidChanged(at indexPath: IndexPath?, selected: Bool?) {
        let count = self.tableNode.indexPathsForSelectedRows?.count ?? 0
        
        if let deleteBarItem = self.toolbarItems?.last {
            deleteBarItem.isEnabled = count != 0
        }
        
        if let selectAllBarItem = self.toolbarItems?.first {
            if count > 0 {
                if count == self.tableNode.numberOfRows(inSection: 0) {
                    selectAllBarItem.title = "取消全选(\(count))"
                } else {
                    selectAllBarItem.title = "选择全部(\(count))"
                }
            } else {
                selectAllBarItem.title = "选择全部"
            }
        }
    }
    
    func delete(at indexPathes: [IndexPath]) {
        self.tableNode.performBatchUpdates({
            let sortedIndexPathes = indexPathes.sorted(by: { (indexPath1, indexPath2) -> Bool in
                return indexPath1.row > indexPath2.row
            })
            sortedIndexPathes.forEach({ (indexPath) in
                
                tableNode.deleteRows(at: [indexPath], with: .automatic)
            })
        }, completion: { (finished) in
            let totleCount = self.tableNode.numberOfRows(inSection: 0)
            self.itemSelectedStatusDidChanged(at: nil, selected: nil)
            if totleCount == 0 {
                self.editList(isEditing: false)
            }
        })
        
        self.filterExpressionMananger.save()
    }
}

// MARK: - Action
extension ExpressionListController {
    @objc func addExpressionAction() {
        self.createExpression()
    }
    
    @objc func editAction() {
        self.editList(isEditing: !self.tableNode.view.isEditing)
    }
    
    @objc func selectAllAction() {
        let selectedCount = self.tableNode.indexPathsForSelectedRows?.count ?? 0
        let totalCount = self.tableNode.numberOfRows(inSection: 0)
        if selectedCount == totalCount {
            for index in 0..<totalCount {
                let row = IndexPath(row: index, section: 0)
                self.tableNode.deselectRow(at: row, animated: true)
            }
        } else {
            for index in 0..<totalCount {
                let row = IndexPath(row: index, section: 0)
                self.tableNode.selectRow(at: row, animated: true, scrollPosition: .none)
            }
        }
        
        self.itemSelectedStatusDidChanged(at: nil, selected: nil)
    }
    
    @objc func deleteAction() {
        if let selectedRows = self.tableNode.indexPathsForSelectedRows {
            self.delete(at: selectedRows)
        }
    }
}

extension ExpressionListController: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let model = ExpressionEditManager.shared.modelAt(index: indexPath.row)
        return { () -> ASCellNode in
            if let cellModel = model {
                return ExpressionCellNode(model: cellModel)
            } else {
                return ASCellNode()
            }
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return ExpressionEditManager.shared.numberOfExpression()
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        if !tableNode.view.isEditing {
            tableNode.deselectRow(at: indexPath, animated: true)
        } else {
            self.itemSelectedStatusDidChanged(at: indexPath, selected: true)
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, didDeselectRowAt indexPath: IndexPath) {
        if tableNode.view.isEditing {
            self.itemSelectedStatusDidChanged(at: indexPath, selected: false)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .default, title: "删除") { (act, indexPath) in
            self.delete(at: [indexPath])
        }
        
        return [action]
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        
        return proposedDestinationIndexPath
    }
}
