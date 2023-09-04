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


//Fazendo requisicao do jeito mais simpes posivel

//1 - CRIAR A ESTRUTURA DO OBJETO, ja que e uma lista de nomes eu vou criar um array que vai  segurar esses nones

struct listaDePokemons: Codable {
    var pokemons: [pokemonsResponse]
}

//2 - Criar o formato do objeto para aguardar o respnse, o objeto vai  ter que ser decodable por que eu vou receber em json e vou passar para swift

struct pokemonsResponse: Codable {
    
    var name: String
    
}



//3 - Agora eu tenho que criar o formato mais simples de request de API come;ancdo sempre com o class e depois a funcao

class pokemonApi {
    
    func getPokemon() {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            
            if let data = data {
                
                do {
                    let pokemons = try JSONDecoder().decode(listaDePokemons.self, from: data)
                } catch {
                    print("Error on decode Json \(error)")
                }
                
                return}
            
            guard let response = response as? HTTPURLResponse else {return}
            
            if let error {
                print("Error on get the API: \(error)")
            }
            
            
            
        }
        
        
        
        
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


