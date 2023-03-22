//
//  Home.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/22/23.
//

import SwiftUI

struct Home: View {
    
    @State var showHome = false
    @State var offset: CGSize = .zero
    var body: some View{
        ZStack{
            
            
            
            
            Color(.systemRed)
                .overlay(
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Catch them all!   <".uppercased())
                            .font(.custom("Retro Gaming", size: 20))
                            .bold()
                            .offset(x: 0, y: -300)
                        
                    })
                
                )
                .clipShape(LiquidSwipe(offset: offset))
                .ignoresSafeArea()
                .padding(.trailing)
                .overlay(
             
                Image("icons8-pokeball-48")
                //For Draggesture to identify...
                    .resizable()
                    .frame(width: 50, height: 50)
                    .shadow(color: .red.opacity(0.6), radius: 3, x: 1, y: 2)
                    .contentShape(Rectangle())
                    .gesture(DragGesture().onChanged({ (value) in
                        
                        // animating swipe offset...
                        
                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                            offset = value.translation
                        }
                    }).onEnded({ (value) in
                      
                        let screen = UIScreen.main.bounds
                        
                        withAnimation(.spring()){
                            
                            // validating...
                            if -offset.width > screen.width / 2{
                                //removing view..
                                offset.width = -screen.height
                                showHome.toggle()
                            } else{
                                offset = .zero
                            }
                            
                        }
                        
                        
                    }))
                   .offset(x:10 ,y: -310)
                //hiding while dragging starts ...
                    .opacity(offset == .zero ? 1 : 0)
                
                ,alignment:  .trailing
                )
                .padding(.trailing)
            
            if showHome {
                ContentView()

                
            }
            
            
        }
    
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct LiquidSwipe: Shape {
    
    // getting Offset
    var offset: CGSize
    
    //animating Pathh...
    var animatableData: CGSize.AnimatableData{
        get{return offset.animatableData}
        set{offset.animatableData = newValue}
    }
    
    
    func path(in rect: CGRect) -> Path {
        return Path { path in

            let width = rect.width + (-offset.width > 0 ? offset.width: 0 )
            
            //First Contructing Rectangle Shape..
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            // NOw Constructing Curve Shape...
            
            //from
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
            
            //Also addingHeight ...
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            //mid between 80 -180 ...
            let mid : CGFloat = 80 + ((to - 80) / 2)
            
            
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 40, y: mid), control2: CGPoint(x: width - 40, y: mid))
            
        }
    }
}
