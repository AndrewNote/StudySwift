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
    private var pokemons = [Pokemon]() {
        didSet {
            collectionView.reloadData()
        }
    }
    private let infoView = InfoView()
    private let collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reusableIdentifier)
        return collectionView
    }()
    
    private let blurView: UIVisualEffectView = {
        let bluerEffect = UIBlurEffect(style: .dark)
        let bluerEffectView = UIVisualEffectView(effect: bluerEffect)
        bluerEffectView.translatesAutoresizingMaskIntoConstraints = false
        return bluerEffectView
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
        blurEffect()
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

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func blurEffect() {
        let blurViewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBackground) )
        blurView.addGestureRecognizer(blurViewTapGestureRecognizer)
    }
    
    // MARK: Selector
    @objc private func didTapRightButton() {
        
    }
    
    @objc private func didTapBackground() {
        infoView.removeFromSuperview()
        blurView.alpha = 0
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
        cell.pokemon = data
        if let imageUrl = cell.imageURL(for: indexPath.row + 1) {
            cell.configureImage(with: imageUrl)
        }
        
        cell.delegate = self
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

extension ClassicsCollectionView: PokemonCellProtocol, InfoViewProtocol {
    func showPopup(pokemon: Pokemon) {
        view.addSubview(blurView)
        view.addSubview(infoView)

        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            infoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
        ])
        
        infoView.delegate = self
        infoView.pokemon = pokemon
    }
    
    func removeInfoView() {
        infoView.removeFromSuperview()
        blurView.alpha = 0
    }
    
}
