//
//  ContentView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 22/08/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals){ item in
                    NavigationLink {
                        AnimalDetailView(animal: item)
                    } label: {
                        AnimalListItemView(animal: item)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Africa")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
