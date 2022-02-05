//
//  fetcher.swift
//  ConHub
//
//  Created by Jayanta kumar on 03/02/22.
//

import Foundation

import SwiftUI

@MainActor
final class FetchManager:ObservableObject{

    @Published private(set) var queryObject:QueryObject  = QueryObject(kind: "", etag: "", nextPageToken: "", regionCode: "", pageInfo: PageInfo(totalResults: 0, resultsPerPage: 0), items: [])
    
    private let fetcherObject:FetcherObject
    
    init(fetcherObject:FetcherObject) {
        self.fetcherObject = fetcherObject
    }
    
    func getQueryObject() async {
        do{
            self.queryObject = try await fetcherObject.fetch(query:"tmux")
        }
        catch{
            print(error)
        }
    }
    
    
    
 
    
   
}

