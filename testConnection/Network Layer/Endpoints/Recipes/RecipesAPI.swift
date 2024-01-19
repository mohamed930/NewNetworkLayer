//
//  RecipesAPI.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import Foundation
import Combine

class RecipesAPI: BaseAPI<RecipesNetworking> {
    
    func fetchRecipes() -> Future<RecipeResponse,NSError> {
        self.requestPublisher(Target: .fetchAllRecipes, ClassName: RecipeResponse.self)
    }
}
