//
//  ContentView.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel(networkManager: NetworkManager())
    @State var searchPokemon = ""
    
    var body: some View {
        NavigationStack {
            
            SearchBarView(searchText: $viewModel.searchText)
            
            ScrollView{
                ForEach(viewModel.listPokemon){pokemon in
                    NavigationLink{
                        DetailView(name: pokemon.name, lvl: pokemon.level ?? "0", HP: pokemon.hp, imageURL: pokemon.images.large, pokeID: pokemon.number)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        ListCell(name: pokemon.name, imageURL: pokemon.images.small)
                    }
                    
                }
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
