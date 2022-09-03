//
//  LocationModel.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 27/08/22.
//

import Foundation
import CoreLocation
struct NationalParkLocation: Codable, Identifiable{
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
    }
}
