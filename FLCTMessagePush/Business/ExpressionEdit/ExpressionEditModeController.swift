//
//  ExpressionEditModeController.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditModeController: ASViewController<ASTableNode> {
    
    let tableNode: ASTableNode
    
    init() {
        self.tableNode = ASTableNode(style: .plain)
        super.init(node: tableNode)
        
        self.tableNode.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        self.tableNode.delegate = self
        self.tableNode.dataSource = self
        self.tableNode.view.separatorStyle = .none
        
        self.title = "编辑模式"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(doneAction))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var inputAccessoryView: UIView? {
        return nil
    }
}


// MARK: - Method
extension ExpressionEditModeController {
    func completeEdit() {
        self.dismiss(animated: true) {
            
        }
    }
}


// MARK: - Action
extension ExpressionEditModeController {
    @objc func doneAction() {
        self.completeEdit()
    }
}


extension ExpressionEditModeController: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cell: ASCellNode
        if let editTypeModel = ExpressionEditManager.shared.editTypeModel(at: indexPath.row) {
            cell = ExpressionEditModelSelectCell(modle: editTypeModel)
        } else {
            cell = ASCellNode()
        }
        return { () -> ASCellNode in
            return cell
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return ExpressionEditManager.shared.numberOfEditType()
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        if let editTypeModel = ExpressionEditManager.shared.editTypeModel(at: indexPath.row) {
            let editModeNodeClass = editTypeModel.editClass
            let editNode = editModeNodeClass.init()
//            self.navigationController?.pushViewController(ExpressionEditController(editNode: editNode), animated: true)
            ExpressionEditManager.shared.saveEditType(model: editTypeModel)
        }
    }
}
