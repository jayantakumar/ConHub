

import Foundation

// MARK: - QueryObject

/// Query Object is the response object received back from Youtube's data API call

struct QueryObject: Codable {
    let kind: String
    let etag: String
    let nextPageToken: String
    let regionCode: String
    let pageInfo: PageInfo
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case etag = "etag"
        case nextPageToken = "nextPageToken"
        case regionCode = "regionCode"
        case pageInfo = "pageInfo"
        case items = "items"
    }
}

// MARK: - Item
class Item: Codable,Identifiable {
    let id:UUID = UUID()
    let kind: String
    let etag: String
    let vid: ID
    let snippet: Snippet

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case etag = "etag"
        case vid = "id"
        case snippet = "snippet"
    }
}

// MARK: - ID
class ID: Codable {
    let kind: String
    let videoID: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case videoID = "videoId"
    }
}

// MARK: - Snippet
class Snippet: Codable {
  
    
    let publishedAt: String
    let channelID: String
    let title: String
    let snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let liveBroadcastContent: String
    let publishTime: String

    enum CodingKeys: String, CodingKey {
        case publishedAt = "publishedAt"
        case channelID = "channelId"
        case title = "title"
        case snippetDescription = "description"
        case thumbnails = "thumbnails"
        case channelTitle = "channelTitle"
        case liveBroadcastContent = "liveBroadcastContent"
        case publishTime = "publishTime"
    }
}

// MARK: - Thumbnails
class Thumbnails: Codable {
    let thumbnailsDefault: Default
    let medium: Default
    let high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium = "medium"
        case high = "high"
    }
}

// MARK: - Default
class Default: Codable {
    let url: String
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case width = "width"
        case height = "height"
    }
}

// MARK: - PageInfo
struct PageInfo: Codable {
    
    let totalResults: Int
    let resultsPerPage: Int

    enum CodingKeys: String, CodingKey {
        case totalResults = "totalResults"
        case resultsPerPage = "resultsPerPage"
    }
}

