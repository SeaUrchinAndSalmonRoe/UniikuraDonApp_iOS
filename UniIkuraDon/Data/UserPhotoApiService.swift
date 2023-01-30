//
//  UserPhotoApiService.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/24.
//

import Foundation
import Moya

enum UserPhotoApiService {
    case getPhotoList
    case getPhotoById(id: String)
}

extension UserPhotoApiService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.unsplash.com")!
    }
    
    var path: String {
        let userName = "takebeau"
        switch self {
        case .getPhotoList:
            return "/users/\(userName)/photos"
        case .getPhotoById(let id):
            return "/photos/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getPhotoList, .getPhotoById:
            return .get
        }
    }
    
    var task: Task {
        switch self{
        case .getPhotoList, .getPhotoById:
            let unit = "metric"
            let lang = "ja"
            return .requestParameters(parameters: ["units": unit, "lang": lang], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        let apiKey = "ajqbfMsJF5dweTPciJJzCWTI9k5a3HSzxTSTGrnzh6M"
        return ["Content-type": "application/json", "Authorization": "Client-ID \(apiKey)"]
    }
}
