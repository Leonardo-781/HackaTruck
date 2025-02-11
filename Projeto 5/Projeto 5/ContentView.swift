import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RosaView()
                .tabItem {
                    Image(systemName: "paintbrush.fill")
                    Text("Rosa")
                }
            
            AzulView()
                .tabItem {
                    Image(systemName: "paintbrush.pointed.fill")
                    Text("Azul")
                }
            
            CinzaView()
                .tabItem {
                    Image(systemName: "paintpalette.fill")
                    Text("Cinza")
                }
            
            ListaView()
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Lista")
                }
        }
    }
}

#Preview {
    ContentView()
}
