//
//  PokemonService.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/07/21.
//

import Foundation

protocol PokemonServiceProtocol {
    func pokemonService(pokemons: PokemonListResponse)
}

// HTTP 통신을 하기 위해서는 URL이 필요
class PokemonService {
    let url = "https://pokeapi.co/api/v2/pokemon?limit=150"
    var delegate: PokemonServiceProtocol?
    
    func fetchPokemons() {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        do {
                            let pokemons = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                            DispatchQueue.main.async {
                                self.delegate?.pokemonService(pokemons: pokemons)    // self check
                            }
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }.resume()
        }
    }
}
