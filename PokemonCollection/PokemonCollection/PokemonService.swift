//
//  PokemonService.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/07/21.
//

import Foundation

// HTTP 통신을 하기 위해서는 URL이 필요

class PokemonService {
    let url = "https://pokeapi.co/api/v2/pokemon/"
    
    func fetchPokemons() {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        do {
                            let pokemons = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                            print(pokemons)
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }.resume()
        }
    }
}
