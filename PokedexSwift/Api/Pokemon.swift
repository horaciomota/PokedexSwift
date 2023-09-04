//
//  Pokemon.swift
//  PokedexSwift
//
//  Created by Horacio Mota on 03/09/2023.
//

//EndPoint API: https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation
import UIKit

struct Pokemon : Codable{
    var results: [PokemonEntry]
}

struct PokemonEntry : Codable, Identifiable  {
    let id = UUID()
    var name: String
    var url: String
}

class PokeApi  {
    func getData(completion:@escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
}

struct listaDePokemons: Codable {
    
    var pokemonsListados: [pokemons]
    
}


struct pokemons: Codable {
    
    var name: String
    var type: String
    var abilities: [String]
    
}

class pokemonApi {
    func getData() {
        
        guard let url = URL(string: "a chave da API vai aqui") else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data {
                do {
                    let pokemonsListados = try JSONDecoder().decode(listaDePokemons.self, from: data)
                } catch {
                    print("Erro de rede: \(error)")
                    return
                }
            
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("Resposta inválida da API")
                    return}
                
                if let error {return}
                
            }
        }.resume()
        
    }
}


//class PokemonApi {
//
//    func pegarPokemonsDaApi() {
//        // Eu preciso pegar a URL do projeto
//
//        guard let urlApi = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {return}
//
//        URLSession.shared.dataTask(with: urlApi) { (data, response, error) in
//            if let data = data {
//
//                do {
//                    let pokemons = try JSONDecoder().decode(listaDePokemons.self, from: data)
//
//                } catch {
//                    print("XIIIIII... Deu erro nos dados")
//                }
//
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
//
//            if let error {
//                print("Tem alguma coisa errada com a API \(error)")
//                return
//
//            }
//
//
//        }.resume()
//
//    }
//
//
//}


