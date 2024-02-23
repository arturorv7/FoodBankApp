//
//  tabVar.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

struct tabVar: View {
    @State private var showSignInview: Bool = false
    @Binding var showSignInView : Bool
    var body: some View {
        TabView{
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            
            AboutView()
                .tabItem {
                    Label("Info", systemImage: "square.fill.text.grid.1x2")
                }
            newRecipeView()
                .tabItem {
                    Label("Agregar", systemImage: "plus")
                }
            favoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart")
                }
            settingsView(showSignInView: $showSignInview)
                .tabItem {
                    Label("Ajustes", systemImage: "gear")
                }
        }
    }
}

struct tabVar_Previews: PreviewProvider {
    static var previews: some View {
        tabVar(showSignInView: .constant(false))
            .environmentObject(FavoritesViewModel())
    }
}
