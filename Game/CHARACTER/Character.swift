//
//  Character.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation

class Character {
    // Propriétie
    let name: String
    let type: String
    var health: Int
    let weapon: Weapon

    // INIT
    init(name: String, type: String, health: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.health = health
        self.weapon = weapon
    }
}
