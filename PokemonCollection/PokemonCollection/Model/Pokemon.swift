//
//  Pokemon.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/07/21.
//

import Foundation

// JSON 형태의 데이터를 받아오는데 Swift에서 사용할 수 있게 변환시켜줌

//struct Pokemon: Codable {
//    let name: String?
//    let imageUrl: String?
//    let id: Int?
//    let weight: Int?
//    let height: Int?
//    let defense: Int?
//    let attack: Int?
//    let description: String?
//    let type: String?
//}

struct PokemonListResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}
