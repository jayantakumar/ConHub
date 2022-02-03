//
//  Discover.swift
//  ConHub
//
//  Created by Jayanta kumar on 03/02/22.
//

import SwiftUI

struct Discover: View {
    @StateObject var youtubefetcher = FetchManager()
    
    var body: some View {
        VStack{
            Text(String(youtubefetcher.queryObject.items.count))
            Text("This is discover tab")
        }.onAppear(perform: {
            youtubefetcher.fetch()
        })
            
        
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
