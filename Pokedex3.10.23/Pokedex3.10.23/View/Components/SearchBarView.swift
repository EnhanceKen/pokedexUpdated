//
//  SearchBarView.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/21/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String     
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.red)
                .padding()
            
            TextField("Search by name...", text: $searchText)
                .font(.custom("Retro Gaming", size: 17))
                .disableAutocorrection(true)
                .overlay(
                Image(systemName: "xmark.circle.fill")
                    .padding()

                    .foregroundColor(Color.black.opacity(searchText.isEmpty ? 0.0: 0.7))
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        searchText = ""
                    }
                
                
                ,alignment: .trailing
                )
        }
        .font(.headline)
        .frame(height: 50)
        .background(
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.yellow)
            .shadow(color: .green.opacity(0.5), radius: 3, x: 0, y: 0)
        )
        .padding(.leading, 10)
        .padding(.trailing, 10)

    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
