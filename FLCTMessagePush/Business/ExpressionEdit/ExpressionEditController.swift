//
//  ExpressionEditController.swift
//  FLCTMessagePush
//
//  Created by Mapleiny on 2018/9/18.
//  Copyright © 2018年 Maple. All rights reserved.
//

import AsyncDisplayKit

class ExpressionEditController: ASViewController<ASDisplayNode> {
    
    let editNode: ExpressionEditJuniorModeNode
    let editModel: ExpressionEditModel
    
    var settingCellData: [[ExpressionEditCellModelProtocol]] = []
    
    init(editNode: ExpressionEditJuniorModeNode, editModel: ExpressionEditModel) {
        self.editNode = editNode
        self.editModel = editModel
        super.init(node: editNode)
        
        self.title = editNode.title
        
        editNode.delegate = self
        editNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateDataSource()
        self.editNode.reloadData()
    }
    
    
}

extension ExpressionEditController {
    func updateDataSource() {
        var settingCellData: [[ExpressionEditCellModelProtocol]] = []
        
        // title set
        settingCellData.append([])
        let titleSetModel = ExpressionEditTextSetCellViewModel(titleText: "描述")
        titleSetModel.placeHolderString = "规则名"
        titleSetModel.valueText = editModel.name
        titleSetModel.didUpdateValue = { value in
            if let value = value {
                self.editModel.name = value
            }
        }
        settingCellData[0].append(titleSetModel)
        
        // source
        settingCellData.append([])
        let sourceIndex = editModel.source == .message ? 0 : 1
        let sourceSelect = ExpressionEditSegmentSelectCellViewModle(titleText: "来源",
                                                                    segment: ["内容","发信人"],
                                                                    defaultIndex: sourceIndex)
        sourceSelect.didUpdateValue = { index in
            self.editModel.source = index == 0 ? .message : .sender
        }
        settingCellData[1].append(sourceSelect)
        
        
        // condition
        let conditionIndex = editModel.condition == .contain ? 0 : 1
        let conditionSelect = ExpressionEditSegmentSelectCellViewModle(titleText: "条件",
                                                                       segment: ["包含","不包含"],
                                                                       defaultIndex: conditionIndex)
        conditionSelect.didUpdateValue = { index in
            self.editModel.condition = index == 0 ? .contain : .except
        }
        settingCellData[1].append(conditionSelect)
        
        settingCellData.append([])
        
        
        // text
        let detailText = editModel.keywords.joined(separator: " ")
        let keywordsCellModel = ExpressionEditTextDetailViewModel(titleText: "关键词", detailText: detailText)
        settingCellData[2].append(keywordsCellModel)
        
        
        self.settingCellData = settingCellData
    }
}


// MARK: - Action
extension ExpressionEditController {
    @objc func doneAction() {
        self.dismiss(animated: true) {
            
        }
    }
}



extension ExpressionEditController: ASTableDelegate, ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return self.settingCellData.count
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return self.settingCellData[section].count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let model = self.settingCellData[indexPath.section][indexPath.row]
        
        let cellNode = model.cellNodeClass.init(modelProtocol: model)
        
        return cellNode
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
        if self.settingCellData[indexPath.section][indexPath.row] is ExpressionEditTextDetailViewModel {
            let vc = ExpressionWordsListController(editModel: self.editModel)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
