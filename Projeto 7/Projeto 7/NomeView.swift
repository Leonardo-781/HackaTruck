//
//  NomeView.swift
//  Projeto 7
//
//  Created by Turma01-17 on 11/02/25.
//

import SwiftUI

struct NomeView: View {
    var name: String

    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
            
            VStack {
                Text("Volte:")
                    .font(.title)
                    .padding()
                    .foregroundColor(.black)
                Text(name)
                    .font(.title)
                    .padding()
                    .foregroundColor(.black)
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NomeView(name: "")
}
