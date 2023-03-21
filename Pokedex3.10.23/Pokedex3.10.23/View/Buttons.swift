//
//  Buttons.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/20/23.
//

import SwiftUI

struct Buttons: View {
    
    @StateObject var viewModel:PokemonViewModel
    @State var showingBottomSheet = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                ZStack {
                    
                    Image(systemName: "circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                        .frame(width: 45, height: 45)
                        .background(Color.red)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black, lineWidth: 2)
                        ).shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 3)
                    
                    Text("B")
                        .font(.custom("Retro Gaming", size: 17))
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .offset(x: -12, y: 12)
            Button(action: {
                showingBottomSheet.toggle()
            }) {
                ZStack {
                    
                    Image(systemName: "circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                        .frame(width: 45, height: 45)
                        .background(Color.red)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black, lineWidth: 2)
                        ).shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 3)
                    
                    Text("A")
                        .font(.custom("Retro Gaming", size: 17))
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .offset(x: 12, y: -12)

        }
        .sheet(isPresented: $showingBottomSheet){
            ForEach(viewModel.listPokemon){pokemon in
                CardView(imageURL: pokemon.images.large)
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(viewModel: PokemonViewModel(networkManager: NetworkManager()))
    }
}
