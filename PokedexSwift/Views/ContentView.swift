//
//  ContentView.swift
//  PokedexSwift
//
//  Created by Horacio Mota on 03/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            
            PokeApi().getData() {pokemon in
                
                print(pokemon)
                
                for pokemon in pokemon {
                    print(pokemon.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
