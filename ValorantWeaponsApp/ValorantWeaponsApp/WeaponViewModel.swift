import SwiftUI

class WeaponViewModel: ObservableObject {
    @Published var weapons: [Weapon] = []
    
    func fetchWeapons() {
        guard let url = URL(string: "https://valorant-api.com/v1/weapons") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(WeaponResponse.self, from: data)
                DispatchQueue.main.async {
                    self.weapons = response.data
                }
            } catch {
                print("Error decoding: \(error)")
            }
        }.resume()
    }
}

struct WeaponViewModelPreview: View {
    @StateObject private var viewModel = WeaponViewModel()
    
    var body: some View {
        ZStack {
           
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                List(viewModel.weapons, id: \.uuid) { weapon in
                    Text(weapon.displayName)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(8)
                }
                .onAppear {
                    viewModel.fetchWeapons()
                }
                .navigationTitle("Weapons")
            }
            .background(Color.red.opacity(0.5)) 
        }
    }
}

#Preview {
    WeaponViewModelPreview()
}
