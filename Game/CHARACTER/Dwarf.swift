//
//  Dwarf.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation
class Dwarf: Character {

    init(name: String) {
        super.init(name: name, type: "nain", health: 50, weapon: Axe())
    }
}
