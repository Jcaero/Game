//
//  Dwarf.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation
class Dwarf: Character {

    init(name: String) {
        super.init(name: name, type: .dwarf, health: 50, weapon: Axe())
    }

    convenience init() {
        self.init(name: "")
    }
}
