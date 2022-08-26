//
//  InsetMapView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 26/08/22.
//

import SwiftUI
import MapKit
struct InsetMapView: View {
    // MARK: - PROPERTIES
    @State private var region = MKCoordinateRegion.init(center: CLLocationCoordinate2D.init(latitude: 6.600286, longitude: 16.4377599),span: MKCoordinateSpan.init(latitudeDelta: 60.0, longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(alignment: .topTrailing){
                NavigationLink.init {
                    MapView()
                } label: {
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background {
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    }
                    .padding(12)
                }
            }
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
