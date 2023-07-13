//
//  SpritesModel.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

struct Sprites: Decodable{
    
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault
    }
}
