//
//  TypeElementModel.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

struct TypeElementModel: Decodable {
    let slot: Int?
    let type: SpeciesModel?
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}
