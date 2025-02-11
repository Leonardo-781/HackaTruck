import SwiftUI

struct ContentView: View {
    @State private var distancia: String = ""
    @State private var tempo: String = ""
    @State private var velocidade: Double = 0.0
    @State private var imagem = "primeira"
    @State private var cor : Color = .gray
    
    let animais: [(limite: Double, cor: Color, imagem: String)] = [
        (9.9, Color(hex: "#ABFFAC"), "tartaruga"),
        (29.9, Color(hex: "#ACFFF2"), "elefante"),
        (69.9, Color("hahahah"), "avestruz"),
        (89.9, Color(hex: "#EEFFA4"), "leao"),
        (130.0, Color(hex: "#FF7764"), "guepardo")
    ]
    
    //    var animalAtual: (cor: Color, imagem: String) {
    //        for (limite, cor, imagem) in animais {
    //            if velocidade <= limite {
    //                return (cor, imagem)
    //            }
    //        }
    //        return (Color.gray, "")
    //    }
    
    func update(_ velocidade : Double){
        var i = 0
        
        for v in animais {
            if v.limite < velocidade{
                i += 1
            }
        }
        
        imagem = animais[i].imagem
        cor = animais[i].cor
    }
    
    var body: some View {
        ZStack {
            cor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Digite a distância (km):")
                    .foregroundColor(.white)
                TextField("Distância", text: $distancia)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()
                
                Text("Digite o tempo (h):")
                    .foregroundColor(.white)
                TextField("Tempo", text: $tempo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()
                
                Button("Calcular") {
                    calcularVelocidade()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Text(String(format: "%.2f km/h", velocidade))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                
                Image(imagem)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding()
                
            }
            .padding()
        }
    }
    
    func calcularVelocidade() {
        if let d = Double(distancia), let t = Double(tempo), t > 0 {
            velocidade = d / t
        }
        
        update(velocidade)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: .whitespacesAndNewlines))
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}


#Preview {
    ContentView()
}
