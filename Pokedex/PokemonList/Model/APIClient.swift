//
//  APIClient.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 13/07/23.
//

import Foundation

final class APIClient {
    
    func getPokemon(withId id: Int) async -> PokemonResponseModel{
            let  url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/")!
            let (data, _) = try! await URLSession.shared.data(from: url)
            //let str = String(decoding: data, as: UTF8.self)
            //debugPrint(str)
            return try! JSONDecoder().decode(PokemonResponseModel.self, from: data)
    }
    
    ///Call method
    /*
     let apiClient = APIClient()
     
    Task{
           let model = await apiClient.getPokemon(id: 1)
        }
     */
    
}
