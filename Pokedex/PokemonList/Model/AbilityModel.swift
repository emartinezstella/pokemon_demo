//
//  AbilityModel.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

struct AbilityModel: Decodable {
    let isHidden: Bool?
    let slot: Int?
    let ability: SpeciesModel?

    enum CodingKeys: String, CodingKey {
        case isHidden
        case slot, ability
    }
}
