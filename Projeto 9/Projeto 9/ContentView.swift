import SwiftUI
import MapKit

struct Location: Hashable {
    let name: String
    let latitude: Double
    let longitude: Double
    let flag: String
    let description: String
}

let arrayLocais = [
    Location(
        name: "Selecione a cidade",
        latitude: 0,
        longitude: 0,
        flag: "",
        description: "Escolha uma cidade para exibir no mapa."
    ),
    Location(
        name: "Belo Horizonte",
        latitude: -19.924557,
        longitude: -43.991597,
        flag: "https://upload.wikimedia.org/wikipedia/commons/9/9c/Bandeira-de-Belo-Horizonte.svg",
        description: "Belo Horizonte é a capital de Minas Gerais. Sua população é de 2.315.560 habitantes, segundo o censo de 2022."
    ),
    Location(
        name: "São Paulo",
        latitude: -23.55052,
        longitude: -46.633308,
        flag: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Bandeira_do_estado_de_S%C3%A3o_Paulo.svg",
        description: "São Paulo é a maior cidade do Brasil, com mais de 12 milhões de habitantes e um dos maiores centros financeiros do mundo."
    ),
    Location(
        name: "Rio de Janeiro",
        latitude: -22.9068,
        longitude: -43.1729,
        flag: "https://upload.wikimedia.org/wikipedia/commons/6/6b/Bandeira_da_cidade_do_Rio_de_Janeiro.svg",
        description: "Rio de Janeiro é famoso pelo Cristo Redentor, praias icônicas como Copacabana e pelo Carnaval mundialmente conhecido."
    ),
    Location(
        name: "Brasília",
        latitude: -15.8267,
        longitude: -47.9218,
        flag: "https://upload.wikimedia.org/wikipedia/commons/3/3c/Bandeira_do_Distrito_Federal.svg",
        description: "Brasília é a capital do Brasil, projetada por Oscar Niemeyer e Lúcio Costa, conhecida por sua arquitetura moderna."
    ),
    Location(
        name: "Salvador",
        latitude: -12.9714,
        longitude: -38.5014,
        flag: "https://upload.wikimedia.org/wikipedia/commons/2/28/Bandeira_de_Salvador.svg",
        description: "Salvador é a primeira capital do Brasil e tem forte influência africana, refletida na música, culinária e cultura."
    ),
    Location(
        name: "Sorocaba",
        latitude: -23.5017,
        longitude: -47.4581,
        flag: "https://upload.wikimedia.org/wikipedia/commons/4/4b/Bandeira_de_Sorocaba.svg",
        description: "Sorocaba é um município brasileiro no interior do estado de São Paulo, onde o prefeito e o rei do camarote que faz coisas incriveis pela cidade causando uma grande aprovação da população e causando duvidas pelo resto do brasileiros por se trata de uma cidade a frente de seu tempo."
    )
]

struct ContentView: View {
    @State private var selectedPlace = 0 
    @State private var posicao = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    @State private var showSheetView = false

    var body: some View {
        ZStack {
            Map(position: $posicao) {
                ForEach(arrayLocais, id: \.self) { item in
        
                    if item.name != "Selecione a cidade" {
                        Annotation(item.name, coordinate:
                                    CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            
            VStack {
                Picker("Selecione o Local", selection: $selectedPlace) {
                    ForEach(arrayLocais.indices, id: \.self) { index in
                        Text(arrayLocais[index].name).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 300)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(8)
                .onChange(of: selectedPlace) { _ in
                    let newLocation = arrayLocais[selectedPlace]
                    if newLocation.name != "Selecione a cidade" { // Verifica se a cidade foi selecionada
                        posicao = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: newLocation.latitude, longitude: newLocation.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                            )
                        )
                    }
                }
                
                Spacer()
                
                Button(action: {
                    showSheetView.toggle()
                }) {
                    Text("Ver Detalhes")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .padding()
            
            if showSheetView {
                CristoRedentorSheetView(location: arrayLocais[selectedPlace])
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
