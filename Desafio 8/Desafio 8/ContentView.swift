//
//  ContentView.swift
//  Desafio08_Spotify
//
//  Created by Turma01-7 on 12/02/25.
//

import SwiftUI

struct Song : Identifiable {
    var id : Int
    var name : String
    var artist : String
    var capa : String
}




struct ContentView: View {
    var arrayMusica = [
        Song(id : 1, name: "Leilão", artist: "César Menotti e Fabiano", capa: "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/67/22/44/672244ec-9786-8b8e-ccd2-7cbe9da117f7/06UMGIM31502.rgb.jpg/1200x1200bf-60.jpg"),
        
        Song(id : 2, name: "Um degrau na escada", artist: "Chico Rey e Paraná", capa: "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/69/31/b0/6931b085-1965-989e-809d-409117f55e72/888003546851.jpg/632x632bb.webp"),
        
        Song(id : 3, name: "I don't want to talk about it", artist: "Rod Stewart", capa: "https://i.discogs.com/wnFHYHPMOH9SvLs-WTsyZRZRCd-eQEEfXGGcDRxdHIQ/rs:fit/g:sm/q:40/h:300/w:300/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNzYx/MDMtMTQ3NTA3Mjc1/OS03OTcyLmpwZWc.jpeg" ),
        
        Song(id : 4, name: "Fácil", artist: "Krawk .ft Léozin", capa: "https://images.genius.com/4ba9e0652bbc4c17af7a56e3e4fcce46.1000x1000x1.png"),
        
        Song(id : 5, name: "Shape of You", artist: "Ed Sheeran", capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8dwQEJK9CevftD5m7BM6qL_L5t_nIj-44uw&s"),
        
        Song(id : 6, name: "Sarà perchè ti amo ", artist: "Ricchi e Poveri", capa: "https://i1.sndcdn.com/artworks-wU2lRxi6aNbQT7d4-PkxfZA-t500x500.jpg"),
        
        Song(id : 7, name: "Bohemian Rhapsody", artist: "Queen", capa: "https://upload.wikimedia.org/wikipedia/pt/9/9f/Bohemian_Rhapsody.png")
    ]
    var body: some View {
        
        NavigationStack{
            ZStack {
                LinearGradient(colors: [.blue, .black],
                               startPoint: .top,
                               endPoint: .center)
                
                VStack{
                    
                    VStack{
                        Image("topsongs")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .bottom)
                        
                        Text("Mais tocadas 2024")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.white)
                            .font(.title)
                        
                    }
                    
                    
                    HStack{
                        Image("leo")
                            .resizable()
                            .frame(width: 30, height: 60, alignment: .bottom)
                            .clipShape(Circle())
                        
                        Text("Leonardo")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.white)
                            .font(.title3)
                    }
                    VStack{
                        
                        ForEach(arrayMusica){ index in
                            
                            NavigationLink(destination: TelaMusica(x: index)){
                                
                                
                                HStack{
                                    AsyncImage(url: URL(string: index.capa)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 50, height: 50, alignment: .leading)
                                    
                                    
                                    VStack(alignment: .leading){
                                        Text(index.name)
                                            .foregroundStyle(.white)
                                        Text(index.artist)
                                            .foregroundStyle(.white)
                                            .font(.footnote)
                                    }
                                    Spacer()
                                    
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                    
                                }.frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
