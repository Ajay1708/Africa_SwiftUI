//
//  AnimalGridItemView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 03/09/22.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Image(animal.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
        }
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal:animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
