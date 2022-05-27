// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import SwiftUI

// MARK: - Welcome
struct BrastlewarkResponse: Codable {
    let gnomes: [Gnome]

    enum CodingKeys: String, CodingKey {
        case gnomes = "Brastlewark"
    }
}

// MARK: - Brastlewark
struct Gnome: Codable, Identifiable {
    let id: Int
    let name: String
    let thumbnail: String
    let age: Int
    let weight, height: Double
    let hairColor: HairColor
    let professions: [Profession]
    let friends: [String]

    var ageString: String {
        "\(age) years"
    }

    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, age, weight, height
        case hairColor = "hair_color"
        case professions, friends
    }
}

enum HairColor: String, Codable, Equatable, Identifiable, Comparable {
    var id: Self { self }

    case black = "Black"
    case gray = "Gray"
    case green = "Green"
    case pink = "Pink"
    case red = "Red"

    var color: Color {
        switch self {
        case .black:
            return Color.black
        case .gray:
            return Color.gray
        case .green:
            return Color.green
        case .pink:
            return Color.pink
        case .red:
            return Color.red
        }
    }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        String(describing: lhs) < String(describing: rhs)
    }
}

enum Profession: String, Codable {
    case baker = "Baker"
    case blacksmith = "Blacksmith"
    case brewer = "Brewer"
    case butcher = "Butcher"
    case carpenter = "Carpenter"
    case cook = "Cook"
    case farmer = "Farmer"
    case gemcutter = "Gemcutter"
    case leatherworker = "Leatherworker"
    case marbleCarver = "Marble Carver"
    case mason = "Mason"
    case mechanic = "Mechanic"
    case medic = "Medic"
    case metalworker = "Metalworker"
    case miner = "Miner"
    case potter = "Potter"
    case prospector = "Prospector"
    case sculptor = "Sculptor"
    case smelter = "Smelter"
    case stonecarver = "Stonecarver"
    case tailor = "Tailor"
    case taxInspector = "Tax inspector"
    case tinker = " Tinker"
    case woodcarver = "Woodcarver"
}
