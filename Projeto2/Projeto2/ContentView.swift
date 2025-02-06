import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Image("imagem")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
            
            VStack {
                Text("HackaTruck")
                    .foregroundColor(.red)
                Text("77 universidades")
                    .foregroundColor(.blue)
                Text("5 regiões do Brasil")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    ContentView()
}

