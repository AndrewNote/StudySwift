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
    
    // UICollectionViewFlowLayout 생성
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    // diffable datasource 설정
    dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = item.color
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GameSelectionScreen: UITableViewDiffableDataSource<<#SectionIdentifierType: Hashable & Sendable#>, <#ItemIdentifierType: Hashable & Sendable#>> {
    
}

