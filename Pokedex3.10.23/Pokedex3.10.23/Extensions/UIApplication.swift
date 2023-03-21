//
//  UIApplication.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/21/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
