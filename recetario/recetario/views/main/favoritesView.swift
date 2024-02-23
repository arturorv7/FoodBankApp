//
//  favoritesView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

struct favoritesView: View {
    @EnvironmentObject var favoritesVM : FavoritesViewModel
    var body: some View {
        NavigationView {
            ScrollView{
                favoriteListView(recipes: favoritesVM.favorites)
                    .navigationTitle("Favoritos")
            }
            
        }
        .navigationViewStyle(.stack)
    }
}

struct favoritesView_Previews: PreviewProvider {
    static var previews: some View {
        favoritesView()
            .environmentObject(FavoritesViewModel())
    }
}


