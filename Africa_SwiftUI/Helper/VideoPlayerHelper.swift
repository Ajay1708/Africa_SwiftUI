//
//  VideoPlayerHelper.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 27/08/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer{
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat){
     videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
}
