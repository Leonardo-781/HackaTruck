//
//  WeaponDetailView.swift
//  ValorantWeaponsApp
//
//  Created by Turma01-17 on 17/02/25.
//
import SwiftUI

struct WeaponDetailView: View {
    let weapon: Weapon
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let iconUrl = weapon.displayIcon, let url = URL(string: iconUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 150)
                }
                
                Text(weapon.displayName).font(.largeTitle).bold()
                Text("Category: \(weapon.category)").font(.title2)
                
                if let stats = weapon.weaponStats {
                    Text("Fire Rate: \(stats.fireRate ?? 0) Rounds/Sec")
                    Text("Magazine Size: \(stats.magazineSize ?? 0) Bullets")
                }
                
                Text("Skins:").font(.title2).padding(.top)
                
                ForEach(weapon.skins, id: \.uuid) { skin in
                    VStack {
                        if let skinUrl = skin.displayIcon, let url = URL(string: skinUrl) {
                            AsyncImage(url: url) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 100)
                        }
                        Text(skin.displayName)
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

