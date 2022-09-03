//
//  CenterModifier.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 03/09/22.
//

import SwiftUI
struct CenterModifer: ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
