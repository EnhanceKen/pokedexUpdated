//
//  ListCell.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/20/23.
//

import SwiftUI

struct ListCell: View {
    
    let name: String
    let imageURL: String
    
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: imageURL)){ image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        }placeholder: {
                        ProgressView()
                        }.frame(width: 80, height: 80)
                .padding()
            
            Text(name)
                .font(.custom("Retro Gaming", size: 17))
//                .bold()
            Spacer()
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(name: "pikachu", imageURL: "https://cdn.pixabay.com/photo/2016/07/13/08/31/pokemon-1513925__480.jpg")
    }
}
