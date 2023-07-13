//
//  asd.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

struct GameIndexModel: Decodable {
    let gameIndex: Int?
    let version: SpeciesModel?

    enum CodingKeys: String, CodingKey {
        case gameIndex
        case version
    }
}
