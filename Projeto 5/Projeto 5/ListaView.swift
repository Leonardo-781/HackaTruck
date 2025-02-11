//
//  ListaView.swift
//  Projeto 5
//
//  Created by Turma01-17 on 11/02/25.
//
import SwiftUI

struct ListaView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("List")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            List {
                HStack {
                    Text("Item")
                    Spacer()
                    Image(systemName: "paintbrush.fill")
                }
                
                HStack {
                    Text("Item")
                    Spacer()
                    Image(systemName: "paintbrush.pointed.fill")
                }
                
                HStack {
                    Text("Item")
                    Spacer()
                    Image(systemName: "paintpalette.fill")
                }
            }
            .listStyle(.insetGrouped) 
        }
    }
}


#Preview {
    ListaView()
}
