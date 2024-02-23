//
//  favoriteListView.swift
//  recetario
//
//  Created by user246311 on 10/14/23.
//

import SwiftUI

struct favoriteListView: View {
    var recipes :[Recipe]
    var body: some View {
                VStack{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing:15)], spacing:15){
                        ForEach(recipes){recipe in
                            NavigationLink(destination: recipeView(recipe: recipe)){
                                recipeCardView(recipe:recipe)
                            }
                            
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
            }
        }
    


struct favoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        favoriteListView(recipes: Recipe.all)

        
    }
}
