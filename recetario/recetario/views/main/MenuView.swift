//
//  MenuView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AutheticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
}

struct MenuView: View {
    @StateObject private var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    List {
                        if let user = viewModel.user {
                            Text("Bienvenido: \(user.email!)")
                        }
                        
                        
                    }
                    .task {
                        try? await viewModel.loadCurrentUser()
                    }
                    
                    RecipeList()
                        .navigationTitle("Recetas")
                    
                }
                
                
            }
            }
            
        }

        
    }


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
            MenuView()

    }
}


/*
 List {
     if let user = viewModel.user {
         Text("UserId: \(user.userId)")
     }
     
 }
 .task {
     try? await viewModel.loadCurrentUser()
 }
 */
