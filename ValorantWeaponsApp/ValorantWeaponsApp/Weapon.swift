//
//  Weapon.swift
//  ValorantWeaponsApp
//
//  Created by Turma01-17 on 17/02/25.
//
import Foundation

struct Weapon: Decodable, Hashable {
    let uuid: String
    let displayName: String
    let category: String
    let displayIcon: String?
    let skins: [WeaponSkin]
    let weaponStats: WeaponStats?
}

struct WeaponSkin: Decodable, Hashable {
    let uuid: String
    let displayName: String
    let displayIcon: String?
}

struct WeaponStats: Decodable, Hashable {
    let fireRate: Double?
    let magazineSize: Int?
}
