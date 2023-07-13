//
//  MovesModel.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

struct MoveModel: Decodable {
    let move: SpeciesModel?
   
    enum CodingKeys: String, CodingKey {
        case move
    }
}
