//
//  LoginView.swift
//  MinutasApp
//
//  Created by MTW_000 on 29/11/25.
//

import SwiftUI

struct LoginView: View {
    
    //Estados de los inputs
    //Los @State guardan:
    //Lo que el usuario escribe en Usuario
    //Lo que escribe en Contraseña
    //El mensaje de resultado (Acceso concedido / error).
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginMensaje: String = ""
    @State private var isLoggedIn: Bool = false
    
    //Credenciales
    private let validUsername = "demo"
    private let validPassword = "1234"
    
    
    var body: some View {
        if isLoggedIn {
                // Vista que se muestra cuando el login es correcto
                MinutasView(onLogout: {
                    //Cierre de Sesión
                    isLoggedIn = false
                    username = ""
                    password = ""
                    loginMensaje = ""
                })
        } else {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Spacer()
                    
                    //Logo y Tìtulo
                    VStack(spacing: 12) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 100)
                        
                        Text("Autentificarse")
                            .font(.title2)
                            .fontWeight(.semibold)
                    } // VStack
                    
                    // Campos de usuario y password
                    VStack (alignment: .leading, spacing: 16) {
                        
                        TextField("Usuario", text: $username)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                        
                        SecureField("Contraseña", text: $password)
                            .textFieldStyle(.roundedBorder)
                        
                        //Botòn Ingreso
                        
                        Button(action: login) {
                            Text("Ingresar")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }//Botón Ingresar
                        
                        //Mensaje de Resultado
                        if !loginMensaje.isEmpty {
                            Text(loginMensaje)
                                .font(.footnote)
                                .foregroundColor(
                                    loginMensaje == "Acceso concedido"
                                    ? .green
                                    : .red
                                )
                        } // Condicional if !loginMensaje
                        
                        Spacer()
                        
                        // Créditos
                        HStack {
                            Spacer()
                            Text("powered by RocketFuel")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        
                        
                        
                        
                    }//VStack usuario y password
                    .padding(.horizontal, 32)
                    
                } // VStack
            } //ZStack
        } // else
        
    } // body
    
    //Funciòn de validaciòn de login
    
    private func login() {
        if username == validUsername && password == validPassword {
            loginMensaje = "Acceso concedido"
            isLoggedIn = true //Muestra MinutasView
        }// private func login()
        else {
            loginMensaje = "Usuario o contraseña incorrectos"
            isLoggedIn = false //por si las dudas
        } // else
    }// private func login()
    
} // LoginView


#Preview {
    LoginView()
}
