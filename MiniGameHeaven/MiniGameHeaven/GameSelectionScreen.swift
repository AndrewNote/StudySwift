//
//  GameSelectionScreen.swift
//  MiniGameHeaven
//
//  Created by Andrew on 2023/05/08.
//

import UIKit


enum Section: CaseIterable {
    case main
}

struct Mountain: Hashable {
    let name: String
    let height: Int
    let identifier = UUID()  // Item identifier는 unique해야 하므로
}

class GameSelectionScreen: UIViewController {
    
    private let dataSource: UICollectionViewDiffableDataSource<Section, Mountain>
    private let mainCollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GameSelectionScreen: UITableViewDiffableDataSource<<#SectionIdentifierType: Hashable & Sendable#>, <#ItemIdentifierType: Hashable & Sendable#>> {
    
}

