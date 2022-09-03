//
//  VideoModel.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 27/08/22.
//

import Foundation
struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String{
        "video-\(id)"
    }
}
