//
//  DetailView.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/20/23.
//

import SwiftUI

struct DetailView: View {
    
    @State var showingBottomSheet = false
    
    @Environment(\.presentationMode) var presentationMode
    let name: String
    let lvl: String
    let HP: String
    let imageURL: String
    let pokeID: String
    
    
    var body: some View {
        VStack {
            
            
            VStack{
                
                AsyncImage(url: URL(string: imageURL)){ image in
                                image.resizable().aspectRatio(contentMode: .fit)
                            }placeholder: {
                            ProgressView()
                            }.frame(width: 175, height: 170)
                
                
//                Image("char-pikachu")
//                    .resizable()
//                    .frame(width: 150)
//                    .frame(height: 150)
//                    .frame(alignment: .center)
                
                Text(name)
                    .multilineTextAlignment(.center)
                    .font(.custom("Retro Gaming", size: 17))
                
                HStack{
                    
                    VStack {
                        Text("HP")
                            .font(.custom("Retro Gaming", size: 30))
                            .frame(width: 80, height: 40)
                            .background(Color.pink)
                            .cornerRadius(30)
                            .foregroundColor(Color(.systemYellow))
                            .bold()
                        
                        Text(HP)
                            .font(.custom("Retro Gaming", size: 17))
                            .bold()
                            .foregroundColor(Color(.systemYellow))
                    }
                    
                    Spacer()
                        .frame(width: 40)
                    
                    VStack {
                        Text("lvl")
                            .font(.custom("Retro Gaming", size: 30))
                            .frame(width: 80, height: 40)
                            .background(Color.pink)
                            .cornerRadius(30)
                            .foregroundColor(Color(.systemYellow))
                            .bold()
                        
                        
                        Text(lvl)
                            .font(.custom("Retro Gaming", size: 17))
                            .bold()
                            .foregroundColor(Color(.systemYellow))
                    }
                    
                }
            }.frame(width: 300, height: 300, alignment: .center)
                .background(Color.green)
                .cornerRadius(30)
                .shadow(color: .red, radius: 3)
                .padding()
            
            HStack {
                
                Image(systemName: "circle.grid.cross.fill")
                    .font(.system(size: 100))
                
                
                Spacer()
                    .frame(width: 60)
               
                    Button(action: {
                        //
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
                    CardView(imageURL: imageURL)
                    
                }
                .padding(20)
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    VStack{
                        Ellipse()
                            .frame(width: 50, height: 15)
                            .foregroundColor(.black.opacity(0.9))
                        Text("select".uppercased())
                            .font(.custom("Retro Gaming", size: 12))
                            .foregroundColor(.black.opacity(0.3))
                    }
                    
                    VStack{
                        Ellipse()
                            .frame(width: 50, height: 15)
                            .foregroundColor(.black.opacity(0.9))
                        Text("start".uppercased())
                            .font(.custom("Retro Gaming", size: 12))
                            .foregroundColor(.black.opacity(0.3))
                    }
                    
                    
                }
     
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
        
        

        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name: "Pikachu", lvl: "33", HP: "100", imageURL: "https://cdn.pixabay.com/photo/2016/07/13/08/31/pokemon-1513925_1280.jpg", pokeID: "001")
    }
}
