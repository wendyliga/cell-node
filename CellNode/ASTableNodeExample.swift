//
//  ASTableNode.swift
//  CellNode
//
//  Created by Wendy Liga on 03/07/19.
//  Copyright © 2019 Wendy Liga. All rights reserved.
//

import AsyncDisplayKit

class ASTableNodeExample: ASViewController<ASTableNode>{
    
    init() {
        let tableNode = ASTableNode(style: UITableView.Style.plain)
        
        super.init(node: tableNode)
        
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Table Node Example"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ASTableNodeExample: ASTableDelegate, ASTableDataSource{
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { () -> ASCellNode in
            let cellNode = ASCellNodeExample()
            cellNode.accessibilityIdentifier = "Cell Node Block"
            return cellNode
        }
        
        return cellNodeBlock
    }
}

class ASCellNodeExample: ASCellNode{
    private lazy var titleNode: ASTextNode = {
        let title = ASTextNode()
        title.attributedText = NSAttributedString(string: "Title")
        title.style.height = ASDimension(unit: .points, value: 44)
        
        return title
    }()
    
    override init() {
        super.init()
        
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: titleNode)
    }
}
