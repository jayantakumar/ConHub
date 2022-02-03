//
//  fetcher.swift
//  ConHub
//
//  Created by Jayanta kumar on 03/02/22.
//

import Foundation
import Combine
import SwiftUI

class FetchManager:ObservableObject{

    @Published var queryObject:QueryObject  = QueryObject(kind: "", etag: "", nextPageToken: "", regionCode: "", pageInfo: PageInfo(totalResults: 0, resultsPerPage: 0), items: [])
    
    var cancellables = Set<AnyCancellable>()
    let apiKey:String = ApiKeyManager().apiKey
    
    func fetch(){

    guard let url = URL(string:"https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=20&q=developers&key=\(apiKey)")
    else{
        return
    }
        print(url.absoluteString)
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data , _ ,error in
            print(5)
            guard let data = data , error == nil else {
                return
            }
            do {
               
                let queryObject = try JSONDecoder().decode(QueryObject.self,from: data)
                DispatchQueue.main.async {
                    self.queryObject = queryObject
                }
            } catch  {
                print(error)
            }
        }
        )
    
        task.resume()
    }
 
   
}
