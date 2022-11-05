//
//  ContentView.swift
//  IX
//
//  Created by Christopher Truman on 10/17/19.
//  Copyright © 2019 Christopher Truman. All rights reserved.
//

import SwiftUI
import VideoPlayer
import CoreMedia

struct ContentView: View {

    var content = [["🐈","🐈","🐈","🌈"],
                    ["🐈","🐈","🐈","🌈"]]
    let videos = ["ad_breakup", "aw_jesus_gross", "thats_crazy", "molested", "turkey"]

    var body: some View {
        VStack {
            ForEach(content, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                            Text(item)
                    }
                }.padding(.bottom, 20)
            }
            ScrollView {
                ForEach(videos, id: \.self) {
                    VideoView(videoUrl: Bundle.main.url(forResource: $0, withExtension: "mp4")!)
                        .frame(width: 300, height: 250, alignment: .center)
                }
            }.padding(.bottom, 20)
        }
    }
}

struct VideoView : View {
    @State private var autoReplay: Bool = true
    @State private var mute: Bool = false
    @State private var play: Bool = true
    @State private var time: CMTime = .zero
    
    var videoUrl: URL
    
    init(videoUrl: URL) {
        self.videoUrl = videoUrl
    }
    
    var body: some View {
        VideoPlayer(url: videoUrl, play: $play, time: $time)
        .autoReplay(autoReplay)
        .mute(mute)
        .onBufferChanged { progress in
            // Network loading buffer progress changed
            if progress == 1 {
                play = false
            }
        }
        .onPlayToEndTime {
            // Play to the end time.
        }
        .onReplay {
            // Replay after playing to the end.
        }
        .onStateChanged { state in
            switch state {
            case .loading:
                return
            case .playing(let totalDuration):
                return
            case .paused(let playProgress, let bufferProgress):
                return
            case .error(let error):
                return
            }
        }
        .onTapGesture {
            play.toggle()
        }
        .onAppear { VideoPlayer.preload(urls: [videoUrl]) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
