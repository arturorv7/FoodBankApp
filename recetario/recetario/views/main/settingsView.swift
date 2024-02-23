//
//  settingsView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI
@MainActor
final class SettingsViewModel: ObservableObject {
    func signOut() throws{
        try AutheticationManager.shared.signOut()
            
    }
}

struct settingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView : Bool
    var body: some View {
        NavigationView{
            
                Button("Cerrar Sesion"){
                    Task{
                        do {
                            try viewModel.signOut()
                            showSignInView = true
                        } catch {
                            print(error)
                        }
                    }
                }
            
            .navigationBarTitle("Ajustes")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView(showSignInView: .constant(false))
        
    }
}
