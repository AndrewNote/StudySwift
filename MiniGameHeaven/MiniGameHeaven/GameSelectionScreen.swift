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

struct MenuLabel: Hashable {
    let title: String
    let content: String
}

class GameSelectionScreen: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, MenuLabel>?
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
}

extension GameSelectionScreen {
    
    private func setUpDataSource() {
        let registration = UICollectionView.CellRegistration<MenuListCell, MenuLabel> { cell, IndexPath, menu in
            
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, MenuLabel>(collectionView: mainCollectionView) {
            (collectionView, indexPath, menu) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: menu)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MenuLabel>()
        snapshot.appendSections([.main])
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
}

