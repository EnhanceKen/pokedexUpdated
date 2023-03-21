//
//  ContentView.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    
   
    @State private var searchQuery = ""
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel(networkManager: NetworkManager())
    @State var searchPokemon = ""
    @State private var searchText: String = ""
    
    var filteredPokemon: [Pokemon] {
            viewModel.filterPokemon(with: searchQuery)
        }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                SearchBarView(searchText: $searchText)
                                  .padding(.horizontal)
                              List(viewModel.filterPokemon(with: searchText)) { pokemon in
                                  NavigationLink(destination: DetailView(name: pokemon.name, lvl: pokemon.level ?? "0", HP: pokemon.hp, imageURL: pokemon.images.large, pokeID: pokemon.id).navigationBarBackButtonHidden(true)) {
                                      ListCell(name: pokemon.name, imageURL: pokemon.images.small)
                                  }
                              }
                              .listStyle(InsetListStyle())
                              .navigationTitle("Pokédex")

            }
            
            
        }
        .onAppear{
            viewModel.getListPokemon(urlString: APIEndPoints.PokemonEndPoint)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PokemonViewModel(networkManager: NetworkManager()))
    }
}
