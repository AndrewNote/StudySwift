//
//  GameSelectionScreen.swift
//  MiniGameHeaven
//
//  Created by Andrew on 2023/05/08.
//

import UIKit

// enum은 모든 case, associated value가 Hashable을 준수하면 자동으로 synthesise 됨
enum Section {
    case main
}

struct MenuLabel: Hashable {
    let imageTitle: String
    let title: String
    let identifier = UUID()
}

class GameSelectionScreen: UIViewController {
    private let data: [MenuLabel] = [MenuLabel(imageTitle: "⚾️", title: "숫자야구게임"), MenuLabel(imageTitle: "✊✌️🖐️", title: "묵찌빠게임")]
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, MenuLabel>?
    private let collectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureDataSoruce()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension GameSelectionScreen {
    
    private func configureDataSoruce() {
     
        let cellRegistration = UICollectionView.CellRegistration<MenuListCell, MenuLabel> { (cell, indexPath, label) in
            cell.configure(imageLabel: label.imageTitle, titleLabel: label.title)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, MenuLabel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MenuLabel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
}

