//
//  LoginView.swift
//  MinutasApp
//
//  Created by MTW_000 on 29/11/25.
//


import SwiftUI

struct LoginView: View {
    
    // Estados de los inputs
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginMensaje: String = ""
    
    // Credenciales maquetadas
    private let validUsername = "demo"
    private let validPassword = "1234"
    
    // Callback para avisar que el login fue correcto
    let onLogin: () -> Void
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                // Logo y título
                VStack(spacing: 12) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 100)
                    
                    Text("Autentificarse")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                // Campos de usuario y password
                VStack(alignment: .leading, spacing: 16) {
                    TextField("Usuario", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                    SecureField("Contraseña", text: $password)
                        .textFieldStyle(.roundedBorder)
                    
                    // Botón Ingresar
                    Button(action: login) {
                        Text("Ingresar")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    // Mensaje de resultado
                    if !loginMensaje.isEmpty {
                        Text(loginMensaje)
                            .font(.footnote)
                            .foregroundColor(
                                loginMensaje == "Acceso concedido"
                                ? .green
                                : .red
                            )
                    }
                    
                    Spacer()
                    
                    // Créditos
                    HStack {
                        Spacer()
                        Text("powered by RocketFuel")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .padding(.horizontal, 32)
            }
        }
    }
    
    private func login() {
        if username == validUsername && password == validPassword {
            loginMensaje = "Acceso concedido"
            onLogin()
        } else {
            loginMensaje = "Usuario o contraseña incorrectos"
        }
    }
}

#Preview {
    LoginView(onLogin: {})
}
