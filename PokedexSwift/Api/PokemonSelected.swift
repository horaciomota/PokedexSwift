//
//  PokemonSelected.swift
//  PokedexSwift
//
//  Created by Horacio Mota on 03/09/2023.
//

import Foundation

struct pokemonSelected: Decodable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites: Codable {
    
    var front_default: String
}

class PokemonSelectedApi  {
    func getData(url: String, completion:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprites = try! JSONDecoder().decode(pokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprites.sprites)
            }
        }.resume()
    }
}
