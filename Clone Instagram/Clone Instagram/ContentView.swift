 import SwiftUI

struct ContentView: View {
    var body: some View {
    
    VStack(content: {
    
        HStack {
            Text("Instagram")
                .font(.headline)
                .padding(.leading)

            Spacer()

            HStack(spacing: 10) {
                Image(systemName: "arrow.circlepath")
                Image(systemName: "line.3.horizontal")
            }
            .padding(.trailing)
        }

        HStack {
            ZStack {
                Image("hackatruck")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)

                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    .offset(x: 55, y: 55)
            }

            VStack {
                HStack {
                    VStack {
                        HStack {
                            Text("8")
                                .font(.title)
                        }
                        HStack {
                            Text("Posts")
                                .font(.footnote)
                        }
                    }

                    VStack {
                        HStack {
                            Text("12k")
                                .font(.title)
                        }
                        HStack {
                            Text("Seguidores")
                                .font(.footnote)
                        }
                    }

                    VStack {
                        HStack {
                            Text("2k")
                                .font(.title)
                        }
                        HStack {
                            Text("Seguindo")
                                .font(.footnote)
                        }
                    }
                }
                HStack {
                    Button(action: {}) {
                        Text("Seguir")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .background(Color.gray.opacity(0.6))
                    .buttonStyle(.bordered)
                    .cornerRadius(8)
                }
            }
        }

//           Button("Editar Perfil") {
//           }
//           .background(Color.gray.opacity(0.6))
//           .buttonStyle(.bordered)
//           .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.center)
//           .cornerRadius(8)
        
       

        
        
    })
    .padding()
        VStack(content: {
            HStack(content: {
                Text("Nome Sobrenome")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.leading)
            })
            HStack(content: {
                Text("Esta é a biografia do perfil do usuário.")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.leading)

                    .font(.footnote)
            })
        })
        .padding()
        
        HStack(content: {
            VStack(content: {
                Image(systemName: "square.grid.3x3.fill")
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            
            VStack(content: {
                Image(systemName: "laptopcomputer")
            })
            VStack(content: {
                Image(systemName: "person.crop.circle.fill")
            })
        })
        

        
    HStack(content: {
                    
        VStack {
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
        }
        
        VStack {
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
        }
        
        VStack {
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
        }
        
            
    })
        
        .padding()
    }
}


#Preview {
    ContentView()
}
