//
//  FavoritesViewModel.swift
//  recetario
//
//  Created by user246311 on 10/14/23.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    var favorites: [Recipe]
    var favoritesE: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        favoritesE = []
        favorites = []
    }
    func contains(_ recipe: Recipe) -> Bool{
        favoritesE.contains(recipe.id)
    }
    func add(_ recipe: Recipe){
        objectWillChange.send()
        favoritesE.insert(recipe.id)
        favorites.append(recipe)
        save()
        }
    func remove(_ recipe: Recipe){
        objectWillChange.send()
        favoritesE.remove(recipe.id)
        for (index, Recipe) in favorites.enumerated() {
            if (recipe.id == Recipe.id) {
                favorites.remove(at: index)
                return
            }
        }
        
    }
    func save(){
        
    }
}
