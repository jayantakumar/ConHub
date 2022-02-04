//
//  Discover.swift
//  ConHub
//
//  Created by Jayanta kumar on 03/02/22.
//

import SwiftUI

struct Discover: View {
    
    @EnvironmentObject var youtubefetcher:FetchManager
    
    var body: some View {

        switch youtubefetcher.queryObject.items.isEmpty{
        case true : ProgressView()
        case false :
             List {
                ForEach(youtubefetcher.queryObject.items) {
                    item in
                    HStack{
                        AsyncImage(url: URL(string: item.snippet.thumbnails.medium.url)){ phase in
                            if let image = phase.image{
                            image
                                .resizable()
                                .scaledToFit()
                            }
                            else if phase.error != nil {
                                Image(systemName: "􀌑")
                            }
                            else{
                                ProgressView().progressViewStyle(.linear)
                            }
                        }
                    
                   .frame(width: 320, height: 180)
                   .padding()
                        
                        Link(item.snippet.title, destination: URL(string: "https://www.youtube.com/watch?v=\(item.videoInfo.videoID)")!)
                            .font(.title).foregroundColor(.primary)
                            
                            .padding()
                        
                    }
                }
            }
        }

    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover().environmentObject(FetchManager(fetcherObject: FetcherObject()))
    }
}
