//
//  RecipesViewModel.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import Foundation
import Combine

class RecipesViewModel {
    var isloadingPublisher = PassthroughSubject<Bool,Never>()
    var responsePublisher = PassthroughSubject<[Hit],Never>()
    
    private let recipeapi = RecipesAPI()
    private var cancallable = Set<AnyCancellable>()
    
    func fetchDataOperation() {
        isloadingPublisher.send(true)
        
        var response = recipeapi.fetchRecipes()
        response.sink(receiveCompletion: { [weak self] error in
            guard let self = self else { return }

            self.isloadingPublisher.send(false)
            
            switch error {
               case .finished: break
               case .failure(let err):
               let e = err.userInfo[NSLocalizedDescriptionKey] as? String ?? ""
                print(e)
                
                if e == "Error in your connection" {
                   response = recipeapi.fetchRecipes()
                }
            }
            
        }, receiveValue: { [weak self] response in
            guard let self = self else { return }
            self.isloadingPublisher.send(false)
            
            self.responsePublisher.send(response.hits)
        }).store(in: &cancallable)
    }
}
