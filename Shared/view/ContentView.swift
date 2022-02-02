//
//  ContentView.swift
//  Shared
//
//  Created by Jayanta kumar on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menuStateManager = MenuStateManager()
    var body: some View {
        NavigationView {
            VStack(spacing:5) {
                ForEach(menuStateManager.items){
                    item in
                    
                        NavigationLink(destination: item.destination, tag: item.id, selection: $menuStateManager.selectedID) {
                            Button(action: {
                                menuStateManager.selectedID =  item.id
                            }, label: {
                                Label(item.name, systemImage: item.systemImage)
                            }).buttonStyle(.borderless).frame(width: 180)
                        
                        }.buttonStyle(.borderless).tint(menuStateManager.selectedID == item.id ? .indigo : .primary).padding().frame(width: 180)
                        
                }
                Spacer()
            }.navigationTitle("ConHub")
           
                
            Text("This is another content")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
