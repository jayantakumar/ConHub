//
//  ConHubApp.swift
//  Shared
//
//  Created by Jayanta kumar on 02/02/22.
//

import SwiftUI

@main
struct ConHubApp: App {
    @StateObject private var youtubefetcher = FetchManager(fetcherObject: FetcherObject())
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(youtubefetcher)
        }
    }
}
