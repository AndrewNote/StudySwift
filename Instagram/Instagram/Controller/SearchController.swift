//
//  SearchController.swift
//  Instargram
//
//  Created by Andrew on 2023/06/26.
//

import UIKit

struct SearchItem: Hashable {
    let image: UIImage
}

class SearchController: UIViewController {
    // MARK: Properties
    private var dataSoruce: UICollectionViewDiffableDataSource<Section, SearchItem>?
    private let dummyData = [SearchItem(image: UIImage())]

    private lazy var collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFeedLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Method
    private func configureUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SearchController {
    // MARK: Layout
    private func createFeedLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // MARK: DataSource
    private func setUpDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FeedCell, SearchItem> { (cell, indexPath, item) in
            
        }
    
        dataSoruce = UICollectionViewDiffableDataSource<Section, SearchItem>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, SearchItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(dummyData)
        dataSoruce?.apply(snapshot, animatingDifferences: true)
    }
}
