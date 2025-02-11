//
//  ContentView.swift
//  Projeto 7
//
//  Created by Turma01-17 on 11/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 390)
                
                
           
                VStack(spacing: 16) {
                    NavigationLink(destination: Modo1Tela()) {
                        Text("Modo 1")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: Modo2Tela()) {
                        Text("Modo 2")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        showSheet.toggle()
                    }) {
                        Text("Modo 3")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                .sheet(isPresented: $showSheet) {
                    SheetView()
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
