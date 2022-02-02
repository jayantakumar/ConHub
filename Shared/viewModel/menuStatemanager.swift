//
//  menuStatemanager.swift
//  ConHub
//
//  Created by Jayanta kumar on 02/02/22.
//

import SwiftUI
import Foundation

final class MenuStateManager:ObservableObject{
    @Published var items:[MenuItem]
    @Published var selectedID:String?
    static let defaultMenuItems: [MenuItem] = [
        MenuItem(name: "Discover", systemImage: "sun.min",destination: AnyView(Text("Hello world"))),
        MenuItem(name: "News", systemImage: "newspaper",destination: AnyView(Text("Hello world"))),
        MenuItem(name: "Bookmarks", systemImage: "bookmark",destination: AnyView(Text("Hello world"))),
        MenuItem(name: "Downloaded", systemImage: "arrow.down.circle",destination: AnyView(Text("Hello world"))),
    
    
    ]
    init(items: [MenuItem] = MenuStateManager.defaultMenuItems) {
        self.items = items
        self.selectedID = items[0].id
    }
    
}
