//
//  LoginView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

@MainActor
final class  SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var contrasena = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !contrasena.isEmpty else {
            print("No se ha encontrado email o contrasena")
            return
        }
        let _ = try await AutheticationManager.shared.signInUser(email: email, password: contrasena)

    }
    
}


struct LoginView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        VStack{
            Image("inicio")
                .frame(width: 300, height: 300)
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
                            try await viewModel.signUp()
                            showSignInView = false
                        } catch {
                            
                        }
                    }
                } label: {
                    Text("Iniciar Sesion")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }

            NavigationLink{
                SignInView(showSignInView: $showSignInView)
            } label: {
                Text("Registrarse")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showSignInView: .constant(false))
    }
}
