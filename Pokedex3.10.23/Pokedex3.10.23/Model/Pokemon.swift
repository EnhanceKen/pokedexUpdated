//
//  Pokemon.swift
//  Pokedex3.10.23
//
//  Created by Consultant on 3/10/23.
//

import Foundation

struct Datum: Codable {
    let data: [Pokemon]
    let page, pageSize, count, totalCount: Int
}

// MARK: - Datum
struct Pokemon: Codable, Identifiable {
    let id, name: String
    let supertype: Supertype
    let subtypes: [Subtype]
    let level: String?
    let hp: String
//    let types: [RetreatCost]
    let evolvesFrom: String?
    let abilities: [Ability]?
   let attacks: [Attack]
//    let weaknesses, resistances: [Resistance]?
//    let retreatCost: [RetreatCost]?
//    let convertedRetreatCost: Int?
//    let datumSet: cardSet
    let number, artist: String
    let rarity: Rarity?
    let nationalPokedexNumbers: [Int]
//    let legalities: Legalities
    let images: DatumImages
////    let tcgplayer: Tcgplayer?
//    let cardmarket: Cardmarket
////    let evolvesTo: [String]?
////    let flavorText: String?
//    let rules: [String]?
//    let regulationMark: String?

//    enum CodingKeys: String, CodingKey {
//        case id, name, supertype, subtypes, level, hp, types, evolvesFrom, abilities, attacks, weaknesses, resistances, retreatCost, convertedRetreatCost
//        case datumSet = "set"
////        case number, artist, rarity, nationalPokedexNumbers, legalities, images, cardmarket, evolvesTo, flavorText, rules, regulationMark
//    }
}

// MARK: - Ability
struct Ability: Codable {
    let name, text: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case ability = "Ability"
    case pokéBody = "Poké-Body"
    case pokéPower = "Poké-Power"
    case pokémonPower = "Pokémon Power"
}

// MARK: - Attack
struct Attack: Codable {
    let name: String
    let cost: [RetreatCost]
    let convertedEnergyCost: Int
    let damage, text: String
}

enum RetreatCost: String, Codable {
    case colorless = "Colorless"
    case darkness = "Darkness"
    case dragon = "Dragon"
    case fighting = "Fighting"
    case fire = "Fire"
    case grass = "Grass"
    case lightning = "Lightning"
    case metal = "Metal"
    case psychic = "Psychic"
    case water = "Water"
}

// MARK: - Cardmarket
struct Cardmarket: Codable {
    let url: String
    let updatedAt: UpdatedAt
    let prices: [String: Double]
}

enum UpdatedAt: String, Codable {
    case the20230313 = "2023/03/13"
}

// MARK: - Set
struct cardSet: Codable {
    let id, name, series: String
    let printedTotal, total: Int
    let legalities: Legalities
    let ptcgoCode: String?
    let releaseDate, updatedAt: String
    let images: SetImages
}

// MARK: - SetImages
struct SetImages: Codable {
    let symbol, logo: String
}

// MARK: - Legalities
struct Legalities: Codable {
    let unlimited: Expanded
    let expanded, standard: Expanded?
}

enum Expanded: String, Codable {
    case legal = "Legal"
}

// MARK: - DatumImages
struct DatumImages: Codable {
    let small, large: String
}

enum Rarity: String, Codable {
    case common = "Common"
    case rare = "Rare"
    case rareHolo = "Rare Holo"
    case rareHoloGX = "Rare Holo GX"
    case rareHoloV = "Rare Holo V"
    case uncommon = "Uncommon"
}

// MARK: - Resistance
struct Resistance: Codable {
    let type: RetreatCost
    let value: String
}

enum Subtype: String, Codable {
    case basic = "Basic"
    case gx = "GX"
    case sp = "SP"
    case stage1 = "Stage 1"
    case stage2 = "Stage 2"
    case tagTeam = "TAG TEAM"
    case v = "V"
}

enum Supertype: String, Codable {
    case pokémon = "Pokémon"
}

// MARK: - Tcgplayer
struct Tcgplayer: Codable {
    let url: String
    let updatedAt: UpdatedAt
    let prices: Prices
}

// MARK: - Prices
struct Prices: Codable {
    let holofoil, reverseHolofoil, normal, the1StEditionHolofoil: The1_StEditionHolofoil?
    let unlimitedHolofoil: The1_StEditionHolofoil?

    enum CodingKeys: String, CodingKey {
        case holofoil, reverseHolofoil, normal
        case the1StEditionHolofoil = "1stEditionHolofoil"
        case unlimitedHolofoil
    }
}

// MARK: - The1_StEditionHolofoil
struct The1_StEditionHolofoil: Codable {
    let low, mid, high: Double
    let market, directLow: Double?
}
