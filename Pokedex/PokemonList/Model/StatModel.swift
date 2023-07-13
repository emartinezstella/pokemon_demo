//
//  StatModel.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

struct StatModel: Decodable {
    let baseStat, effort: Int?
    let stat: SpeciesModel?

    enum CodingKeys: String, CodingKey {
        case baseStat
        case effort, stat
    }
}
