//
//  ContentView.swift
//  Shared
//
//  Created by Jayanta kumar on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    
   
    
    var body: some View {
        NavigationView {
            SideBar()
            Text("Pick up a section")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)

    }
}

struct SideBar: View {
    @StateObject var menuStateManager = MenuStateManager()
    var body: some View {
        List {
            Spacer()
            ForEach(menuStateManager.items){
                item in
                
                NavigationLink(destination: item.destination, tag: item.id, selection: $menuStateManager.selectedID) {
                    Button(action: {
                        menuStateManager.selectedID =  item.id
                    }, label: {
                        Label(item.name, systemImage: item.systemImage).labelStyle(.titleAndIcon)
                            
                    })
                        .buttonStyle(.borderless)
                        
                       
                    
                }
            
            

                
            }
           
            .buttonStyle(.borderless)
            
            Spacer()
          
        }
        .navigationTitle("Console")
        .listStyle(.sidebar)
        
      
    }
}
