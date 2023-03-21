//
//  CardView.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/20/23.
//

import SwiftUI

struct CardView: View {
    
    let imageURL: String
   
    
    var body: some View {
        VStack {
//            Text("# \(rare)")
//                .font(.custom("Retro Gaming", size: 20))
//                .foregroundColor(.black.opacity(0.6))
            
            AsyncImage(url: URL(string: imageURL)){ image in
                image.resizable().aspectRatio(contentMode: .fit)
            }placeholder: {
                ProgressView()
            }.frame(maxWidth: 900, maxHeight: 350)
                .shadow(color: .black.opacity(3), radius: 2, x: 0, y: 0)
            .edgesIgnoringSafeArea(.all)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageURL: "https://cdn.pixabay.com/photo/2016/07/13/08/31/pokemon-1513925_1280.jpg")
    }
}
