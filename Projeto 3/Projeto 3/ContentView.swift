//
//  ContentView.swift
//  Projeto 3
//
//  Created by Turma01-17 on 10/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "User"
    @State private var showingAlert = false

    var body: some View {
        VStack {
            ZStack {
                Image("img")
                    .ignoresSafeArea()
                    .opacity(0.2)
                
                VStack {
                    HStack {
                        Text("Bem vindo, \(name)!")
                            .font(.title)
                    }
                    HStack {
                        TextField("Digite o seu nome:", text: $name)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                        .frame(height: 200)
                    
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 160, height: 100)
                            .shadow(radius: 10)
                    }
                    
                    HStack {
                        Image("truck")
                            .resizable()
                            .frame(width: 190, height: 100)
                            .shadow(radius: 10)
                    }
                    
                    Spacer()
                        .frame(height: 250)
                    
                    HStack {
                        Button("Entrar") {
                            showingAlert = true
                        }
                        .alert("Alerta! Você irá iniciar o desafio da aula agora", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                        .font(.title2)
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
