//
//  CreditsView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 03/09/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
            .scaledToFit()
            .frame(width: 128, height: 128, alignment: .center)
            Text("""
  Copyright © Robert Petras
  All right reserved
  Better Apps ♡ Less Code
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
