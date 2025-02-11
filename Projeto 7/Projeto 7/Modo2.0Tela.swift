//
//  Modo2.0Tela.swift
//  Projeto 7
//
//  Created by Turma01-17 on 11/02/25.
//

import SwiftUI


struct NomeView: View {
    var name: String

    var body: some View {
        VStack {
            Text("Informação digitada:")
                .font(.headline)
                .padding()
            Text(name)
                .font(.title)
                .padding()
        }
        .padding()
    }
}
            
            #Preview {
                Modo2_0Tela()
            }
        
    
