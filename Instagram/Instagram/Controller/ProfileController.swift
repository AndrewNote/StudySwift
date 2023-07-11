//
//  ProfileController.swift
//  Instargram
//
//  Created by Andrew on 2023/06/26.
//

import UIKit

struct ProfileItem: Hashable {
    let userName: String
    let profileImage: UIImageView
    let postCount: Int
    let followerCount: Int
    let followingCount: Int
    let uuid: UUID
}

class ProfileController: UIViewController {
    // MARK: Properties
    private var dataSoruce: UICollectionViewDiffableDataSource<Section, ProfileItem>?
    private let dummyData = [ProfileItem(userName: "Andrew", profileImage: UIImageView(), postCount: 9, followerCount: 3, followingCount: 0, uuid: UUID())]
    
    private lazy var collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFeedLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
    }
    
    // MARK: Method
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
}

extension ProfileController {
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
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return layout
    }
    
        // MARK: DataSource
    private func setUpDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FeedCell, ProfileItem> { (cell, indexPath, item) in
            
        }
        
        dataSoruce = UICollectionViewDiffableDataSource<Section, ProfileItem>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        let headerRegistration = UICollectionView.SupplementaryRegistration(elementKind: UICollectionView.elementKindSectionHeader) { headerView, elementKind, indexPath in
            
        }
        
        dataSoruce?.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as? ProfileHeaderView else {
                return UICollectionReusableView()
            }
            return header
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, ProfileItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(dummyData)
        dataSoruce?.apply(snapshot, animatingDifferences: true)
    }

}
