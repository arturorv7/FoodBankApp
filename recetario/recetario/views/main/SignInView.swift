//
//  SignInView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

@MainActor
final class  SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var contrasena = ""
    
    func signIn() async throws {
        guard !email.isEmpty, !contrasena.isEmpty else {
            print("No se ha encontrado email o contrasena")
            return
        }
        let authDataResult = try await AutheticationManager.shared.createUser(email: email, password: contrasena)
        let user = DBUser(auth: authDataResult)
        try await UserManager.shared.createNewUser(user: user)

    }
    
    
}

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack{
            TextField("Email: ", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Contrasena", text: $viewModel.contrasena)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            Button {
                Task{
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                    } catch {
                        
                    }
                }
            } label: {
                Text("Registrarse")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Registro")
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SignInView(showSignInView: .constant(false))
        }
    }
}
