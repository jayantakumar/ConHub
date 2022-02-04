//
//  fetcherObject.swift
//  ConHub
//
//  Created by Jayanta kumar on 04/02/22.
//

import Foundation
protocol FetchService{
    func fetch() async throws -> QueryObject
}
class FetcherObject:FetchService {
    
    enum FetchManagerError:Error {
    case urlError
    case dataError
        
    }
    
    let apiKey:String = ApiKeyManager().apiKey
    
    func fetch() async throws -> QueryObject {

        guard let url = URL(string:"https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=5&q=developers&key=\(self.apiKey)")
        else{
            throw FetchManagerError.urlError
        }

        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw FetchManagerError.dataError
        }
        print(data.count)
        let decodedData = try JSONDecoder().decode(QueryObject.self, from: data)
        
        return decodedData
       
    }
}
