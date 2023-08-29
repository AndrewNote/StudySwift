//
//  ViewController.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/07/20.
//

import UIKit

let reusableIdentifier = "pokemonCell"

extension ClassicsCollectionView: PokemonServiceProtocol {
    func pokemonService(pokemons: PokemonListResponse) {
        self.pokemons = pokemons.results
    }
}

class ClassicsCollectionView: UIViewController {
    
    // MARK: Properties
    private let pokemonService = PokemonService()
    private var pokemons = [Pokemon]()
    private let infoView = InfoView()
    private let collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reusableIdentifier)
        return collectionView
    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        pokemonService.delegate = self      // Check
        configureNavigation()
        configureUI()
        pokemonService.fetchPokemons()
    }
    
    // MARK: Method
    private func configureNavigation() {
        title = "포켓몬 도감"
        navigationController?.navigationBar.tintColor = .systemBackground
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(didTapRightButton))
        
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(infoView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -55),
            infoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            infoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
    }
    
    // MARK: Selector
    @objc private func didTapRightButton() {
        
    }
    
    private func removeInfoViewAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.infoView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        })
    }
    
}

// MARK: DataSource
extension ClassicsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as? PokemonCell else {
            return UICollectionViewCell()
        }
        let data = pokemons[indexPath.row]
        cell.sendData(name: data.name)
        if let imageUrl = cell.imageURL(for: indexPath.row + 1) {
            cell.configureImage(with: imageUrl)
        }
        return cell
    }
}

// MARK: DelegateFlowLayout
extension ClassicsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (view.frame.width - 36) / 3
        return CGSize(width: length, height: length)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
}
