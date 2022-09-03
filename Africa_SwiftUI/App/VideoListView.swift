//
//  VideoListView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 22/08/22.
//

import SwiftUI

struct VideoListView: View {
    @State private var videos: [Video]  = Bundle.main.decode("videos.json")
    //let hapticImapact = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink {
                        VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                    } label: {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    //Shuffle
                    videos.shuffle()
                    //hapticImapact.impactOccurred()
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                }

            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
