//
//  TelaMusica.swift
//  Desafio08_Spotify
//
//  Created by Turma01-7 on 12/02/25.
//

import SwiftUI
import AVFoundation

struct TelaMusica: View {

    @State private var isPlaying = false
    
    @State var player = AVPlayer()

    @State var x : Song
  
    @State var audioURL : String = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .center)
                .ignoresSafeArea()

            VStack {
                AsyncImage(url: URL(string: x.capa)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                
                Text(x.name)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                
                Text(x.artist)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
           
                HStack {
                    Button(action: { print("Shuffle") }) {
                        Image(systemName: "shuffle")
                    }
                    Spacer()
                    Button(action: { print("Back") }) {
                        Image(systemName: "backward.end.fill")
                    }
                    Spacer()
                    Button(action: {
                        if isPlaying {
                            player.pause()
                        } else {
                            if player.currentItem == nil {
                                player.replaceCurrentItem(with: AVPlayerItem(url: URL(string: audioURL)!))
                            }
                            player.play()
                        }
                        isPlaying.toggle()
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    }
                    Spacer()
                    Button(action: { print("Next") }) {
                        Image(systemName: "forward.end.fill")
                    }
                    Spacer()
                    Button(action: { print("Repeat") }) {
                        Image(systemName: "repeat")
                    }
                }
                .padding()
                .font(.largeTitle)
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Tocando agora")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Tocando agora")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            
        }

    }
}

#Preview {
    TelaMusica(x: Song(id: 1, name: "Nome da musica aqui", artist: "Artista aqui", capa: ""))
}
