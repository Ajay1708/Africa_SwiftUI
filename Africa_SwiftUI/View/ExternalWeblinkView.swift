//
//  ExternalWeblinkView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 26/08/22.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!) {
                        Text(animal.name)
                    }

                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
