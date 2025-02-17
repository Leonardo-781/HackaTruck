import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeaponViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                Image("backgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: .infinity, alignment: .topLeading)
                
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Valorant Weapons")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    
                    //     Spacer(minLength: 2)
                    
                    
                    VStack {
                        ScrollView{
                            ForEach(viewModel.weapons, id: \.uuid) { weapon in
                                NavigationLink(destination: WeaponDetailView(weapon: weapon)) {
                                    HStack {
                                        if let iconUrl = weapon.displayIcon, let url = URL(string: iconUrl) {
                                            AsyncImage(url: url) { image in
                                                image.resizable().scaledToFit()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 220, height: 60)
                                            .cornerRadius(4)
                                        }
                                        
                                        Text(weapon.displayName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.leading, 10)
                                    }
                                    .padding(.vertical, 5)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0.6)))   .padding(.horizontal)
                                }
                            }
                        }
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchWeapons()
            }
        }
    }
}

#Preview {
    ContentView()
}
