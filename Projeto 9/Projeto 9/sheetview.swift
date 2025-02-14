//
//  CristoRedentorSheetView.swift
//  Projeto 9
//
//  Created by Turma01-17 on 13/02/25.
//

import SwiftUI

struct CristoRedentorSheetView: View {
    let location: Location
    
  
    
    var body: some View {

        VStack(alignment: .center, spacing: 20) {
            AsyncImage(url: URL(string: location.flag)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            
           
            
            Text(location.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(location.description)
                .font(.body)
                .padding()
                .background(Color.gray.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)
            
            
                .padding()
            
            }
    }
}

struct CristoRedentorSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CristoRedentorSheetView(location: arrayLocais[2])
    }
}
