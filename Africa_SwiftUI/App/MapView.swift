//
//  MapView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 22/08/22.
//

import SwiftUI
import MapKit
struct MapView: View {
    
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D.init(latitude: 6.600286, longitude: 16.4377599)
        var maxZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        return MKCoordinateRegion.init(center: mapCoordinates, span: maxZoomLevel)
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // MARK: - 1. BASIC MAP
        //Map.init(coordinateRegion: $region)
        
        // MARK: - ADVANCED MAP
        Map.init(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) OLD STYLE (always static)
            //MapPin.init(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER NEW STYLE (always static)
            //MapMarker.init(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactable)
            /*MapAnnotation.init(coordinate: item.location) {
             Image("logo")
             .resizable()
             .scaledToFit()
             .frame(width: 32, height: 32)
             }*/
            // (D) CUSTOM ADVANCED ANNOTATION (it could be interactable)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
        .overlay(alignment: .top) {
            HStack(spacing: 10){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  48, height: 48)
                VStack(alignment: .leading, spacing: 3){
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background {
                Color.black
                    .opacity(0.6)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
