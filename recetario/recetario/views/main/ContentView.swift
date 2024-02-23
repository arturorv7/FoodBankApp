//
//  ContentView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignInView: Bool = false
    @StateObject var favorites = FavoritesViewModel()
    var body: some View {
        ZStack {
            NavigationStack{
                tabVar(showSignInView: $showSignInView)
                
            }
            .environmentObject(favorites)
        }
        .onAppear(){
            let authUser = try? AutheticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil 
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack {
                LoginView(showSignInView: $showSignInView)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FavoritesViewModel())
    }
}
