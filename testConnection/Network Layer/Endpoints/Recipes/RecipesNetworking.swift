//
//  RecipesNetworking.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import Foundation
import Alamofire

enum RecipesNetworking {
    case fetchAllRecipes
}

extension RecipesNetworking: TargetType {
    var baseURL: Api {
        return .baseUrl
    }
    
    var path: Api {
        return .recipesEndpoint
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .fetchAllRecipes:
            return .requestParameters(parameters: ["type": "public","q":"All","app_id": "86729af9","app_key":"6fbf56c8d0837728cb0a94aeb4f5b062"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
