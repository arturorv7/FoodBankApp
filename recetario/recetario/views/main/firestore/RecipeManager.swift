//
//  RecipeManager.swift
//  recetario
//
//  Created by user246311 on 10/12/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


final class RecipeManager {
    
    static let shared = RecipeManager()
    private init() { }
    
    private let recipeCollection = Firestore.firestore().collection("recipes")
    
    let db = Firestore.firestore()
    
    private func recipeDocument(id: String) -> DocumentReference{
        recipeCollection.document(id)
    }
    func uploadRecipe(recipe : Recipe) async throws {
        try await db.collection("recipes").addDocument(data:[
            "id": UUID().uuidString,
            "name": recipe.name!,
            "description": recipe.description!,
            "image": recipe.image!,
            "ingredients": recipe.ingredients!,
            "instructions": recipe.instructions!,
            "preparationTime": recipe.preparationTime!,
            "publicationDate": recipe.publicationDate!,
            "portions": recipe.portions!
        ])
    }
    
    func getRecipe(recipeId: String) async throws -> Recipe{
        try await recipeDocument(id: recipeId).getDocument(as: Recipe.self)
    }
    
    func getAllRecipes() async throws-> [Recipe]{
        let snapshot = try await recipeCollection.getDocuments()
        var recipes: [Recipe] = []
        
        for document in snapshot.documents {
            let recipe = try document.data(as: Recipe.self)
            recipes.append(recipe)
        }
        return recipes
    }
}

