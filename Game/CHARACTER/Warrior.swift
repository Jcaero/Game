//
//  Warrior.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation
class Warrior: Character {
    // Init
    init(name: String) {
        super.init(name: name, type: "Guerrier", health: 100, weapon: Sword(value: 10))
    }

    convenience init() {
        self.init(name: "")
    }
}
