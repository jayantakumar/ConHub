//
//  ContentView.swift
//  Shared
//
//  Created by Jayanta kumar on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            
            Text("Hello, world!")
                .bold()
            .padding()
            Button(action: {}, label: {Label("Test", systemImage: "play")})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
