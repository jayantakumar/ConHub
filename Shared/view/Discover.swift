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
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(youtubefetcher.queryObject.items) {
                        item in
                        VStack(alignment:.leading){
                            AsyncImage(url: URL(string: item.snippet.thumbnails.medium.url)){ phase in
                                if let image = phase.image{
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                               
                                
                                    
                                }
                                else if phase.error != nil {
                                    Image(systemName: "􀌑")
                                }
                                else{
                                    ProgressView().progressViewStyle(.linear)
                                }
                            }
                        
                       .frame(width: 256, height: 144)
                       .padding()
                            
                            Link(item.snippet.title, destination: URL(string: "https://www.youtube.com/watch?v=\(item.videoInfo.videoID)")!)
                                .font(.headline).foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                                .frame(width:250)
                                .padding()
                                
                            
                        }
                    }
                }
            }.frame(height:250)
        }

    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover().environmentObject(FetchManager(fetcherObject: FetcherObject()))
    }
}
