//
//  PokemonResponseModel.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

struct PokemonResponseModel: Decodable {
    
    let id: Int?
    let name: String?
    let baseExperience: Int?
    let height: Int?
    let order: Int?
    let weight: Int?
    let abilities: [AbilityModel]?
    let forms: [SpeciesModel]?
    let gameIndices: [GameIndexModel]?
    let moves: [MoveModel]?
    let species: SpeciesModel?
    let sprites: Sprites?
    let stats: [StatModel]?
    let types: [TypeElementModel]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience
        case height
        case order
        case weight
        case abilities
        case forms
        case gameIndices
        case moves
        case species
        case sprites
        case stats
        case types
    }
}






