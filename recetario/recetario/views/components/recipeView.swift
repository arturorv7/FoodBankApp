//
//  recipeView.swift
//  recetario
//
//  Created by user246311 on 10/6/23.
//

import SwiftUI


struct recipeView: View {
    @EnvironmentObject private var viewModel: FavoritesViewModel
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: recipe.image!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName:"photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint:.top, endPoint: .bottom))
            
            VStack(spacing: 30){
                HStack{
                    Text(recipe.name!)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Button{
                        if viewModel.contains(recipe){
                            viewModel.remove(recipe)
                        } else {
                            viewModel.add(recipe)
                        }
                    } label: {
                        Label("Toggle Favorite", systemImage: viewModel.contains(recipe) ? "heart.fill" : "heart")
                            .labelStyle(.iconOnly)
                            .foregroundStyle(viewModel.contains(recipe) ? .red : .gray)
                    }
                }
                
                VStack(alignment: .leading, spacing: 30){
                    Text(recipe.description!)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Ingredientes")
                            .font(.headline)
                            .padding()
                        
                        Text(recipe.ingredients!)
                            .padding(.horizontal)
                    }
                    VStack(alignment: .leading, spacing: 20){
                        Text("Instrucciones")
                            .font(.headline)
                        Text(recipe.instructions!)
                    }
                    .padding()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
        
}

struct recipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            recipeView(recipe: Recipe.all[0])
        }
        .environmentObject(FavoritesViewModel())
        }
        
}
