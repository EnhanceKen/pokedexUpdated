//
//  DirectionalPadView.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/20/23.
//

import SwiftUI

struct DirectionalPadView: View {
    let buttonSize: CGFloat = 64
     
     var body: some View {
         VStack(spacing: 16) {
             HStack(spacing: 16) {
                 Button(action: {
                     // Action for up button
                 }) {
                     Image(systemName: "arrowtriangle.up.fill")
                         .resizable()
                         .scaledToFit()
                         .frame(width: buttonSize, height: buttonSize)
                         .foregroundColor(.white)
                 }
             }
             HStack(spacing: 16) {
                 Button(action: {
                     // Action for left button
                 }) {
                     Image(systemName: "arrowtriangle.left.fill")
                         .resizable()
                         .scaledToFit()
                         .frame(width: buttonSize, height: buttonSize)
                         .foregroundColor(.white)
                 }
                 Spacer()
                 Button(action: {
                     // Action for right button
                 }) {
                     Image(systemName: "arrowtriangle.right.fill")
                         .resizable()
                         .scaledToFit()
                         .frame(width: buttonSize, height: buttonSize)
                         .foregroundColor(.white)
                 }
             }
             HStack(spacing: 16) {
                 Button(action: {
                     // Action for down button
                 }) {
                     Image(systemName: "arrowtriangle.down.fill")
                         .resizable()
                         .scaledToFit()
                         .frame(width: buttonSize, height: buttonSize)
                         .foregroundColor(.white)
                 }
             }
         }
         .padding()
         .background(Color.gray)
         .cornerRadius(16)
     }
    }


struct DirectionalPadView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionalPadView()
    }
}
