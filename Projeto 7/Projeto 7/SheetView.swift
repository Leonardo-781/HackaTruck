//
//  SheetView.swift
//  Projeto 7
//
//  Created by Turma01-17 on 11/02/25.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        VStack {
            
            Text("Nome: Leo\nSobrenome: Moura")
                .padding()
                .background(Color.pink)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
        .navigationTitle("Sheet View")
        
    }
}



#Preview {
    SheetView()
}

