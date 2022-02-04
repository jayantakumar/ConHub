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
        Group {
            if youtubefetcher.queryObject.items.count == 0
            {
                ProgressView()
            }
            else {
            List {
                ForEach(youtubefetcher.queryObject.items) {
                    item in
                    VStack{
                        Text(item.snippet.channelTitle)

                        
                    }
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
