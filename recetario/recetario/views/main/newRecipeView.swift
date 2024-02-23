//
//  newRecipeView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

struct newRecipeView: View {
    
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView{
            Button("Agregar receta"){
                showAddRecipe = true
            }
            .navigationTitle("Nueva receta")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe){
            AddRecipe()
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        newRecipeView()
    }
}
