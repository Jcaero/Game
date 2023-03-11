//
//  Warrior.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation
class Warrior: Character {

    init(name: String) {
        super.init(name: name, type: "combatant", health: 100, weapon: Sword(value: 10))
    }
}
