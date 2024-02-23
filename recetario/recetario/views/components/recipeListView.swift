//
//  recipeListView.swift
//  recetario
//
//  Created by user246311 on 10/6/23.
//

import SwiftUI
@MainActor
final class RecipesViewModel: ObservableObject{
    @Published private(set) var recipes:[Recipe] = []
    
    func getAllRecipes() async throws {
        self.recipes = try await RecipeManager.shared.getAllRecipes()
    }
}

struct RecipeList: View {
    @StateObject private var viewModel = RecipesViewModel()
    var body: some View {
        VStack{
            HStack{
                Text("\(viewModel.recipes.count) \(viewModel.recipes.count > 1 ? "Recetas" : "Receta")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing:15)], spacing:15){
                ForEach(viewModel.recipes){recipe in
                    NavigationLink(destination: recipeView(recipe: recipe)){
                        recipeCardView(recipe:recipe)
                    }
                    
                    
                }
            }
            .padding(.top)
            .task {
                try? await viewModel.getAllRecipes()
            }
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeList()
        }
    }
}
