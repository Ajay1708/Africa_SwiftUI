//
//  VideoPlayerView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 27/08/22.
//

import SwiftUI
import AVKit
struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    var videoSelected: String
    var videoTitle: String
    // MARK: - BODY
    var body: some View {
        VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
            .overlay(alignment: .topLeading){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
            }
            .navigationTitle(videoTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
