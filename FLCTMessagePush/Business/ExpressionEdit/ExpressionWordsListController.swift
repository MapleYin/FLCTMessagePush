
//
//  ExpressionWordsListController.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/10/11.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionWordsListController: ASViewController<ASDisplayNode> {
    
    let tableNode = ASTableNode(style: .plain)

    private let editModel: ExpressionEditModel
    
    init(editModel: ExpressionEditModel) {
        self.editModel = editModel
        super.init(node: self.tableNode)
        self.tableNode.view.keyboardDismissMode = .interactive
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "关键词"

        self.node.backgroundColor = UIColor.white
        self.node.addSubnode(self.tableNode)
        
        
        self.tableNode.dataSource = self
        self.tableNode.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


// MARK: - ASTableDataSource, ASTableDelegate

extension ExpressionWordsListController: ASTableDataSource, ASTableDelegate {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1 + self.editModel.keywords.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        if indexPath.row == 0 {
            let inputCell = ExpressionEidtInputCellNode()
            inputCell.completeInput = { inputText in
                self.editModel.keywords.insert(inputText, at: 0)
                let insertIndexPath = IndexPath(row: 1, section: 0)
                tableNode.insertRows(at: [insertIndexPath], with: .automatic)
            }
            return inputCell
        } else {
            let word = self.editModel.keywords[indexPath.row-1]
            let textCell = ExpressionEidtTextCellNode(text: word)
            return textCell
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.row == 0 {
            return nil
        }
        let action = UITableViewRowAction(style: .default, title: "删除") { (action, indexPath) in
            let index = indexPath.row - 1
            self.editModel.keywords.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [action]
    }
    
}
