//
//  ContentView.swift
//  IX
//
//  Created by Christopher Truman on 10/17/19.
//  Copyright © 2019 Christopher Truman. All rights reserved.
//

import SwiftUI
import VideoPlayer

struct ContentView: View {

    var content = [["🐈","🐈","🐈","🌈"],
                    ["🐈","🐈","🐈","🌈"]]
    let videoURL = Bundle.main.url(forResource: "ad_breakup", withExtension: "mp4")!
    @State var isPlaying: Bool = true
//                            Text("🌈")
    var body: some View {
        VStack {
            Text("I love you so much that I'm going to rebuild this and re-find as many video clips as I can <3")
                .padding(.bottom)
            ForEach(content, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                            Text(item)
                    }
                }.padding(.bottom, 20)
            }
            VideoPlayer(url: .constant(videoURL), isPlay: $isPlaying)
                .frame(width: 200, height: 200, alignment: .center)
        }.padding() 
    }

//        NavigationView {
//            List {
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//            }
//            .navigationBarTitle("Menu")
//        }
//
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
