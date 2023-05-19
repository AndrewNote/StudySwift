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

class GameSelectionScreen: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, String>?
    private lazy var mainCollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    // UICollectionViewFlowLayout 생성
    
    private let layout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }
    
    // diffable datasource 설정
    dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: mainCollectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GameSelectionScreen {
    
    private func setUpDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(["iOS"])
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
}

