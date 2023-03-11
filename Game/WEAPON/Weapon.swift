//
//  Weapon.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation

class Weapon {
    // Properties
    let name: String
    let value: Int
    let specification: WeaponSpecification

    // INIT
    init(name: String, value: Int, specification: WeaponSpecification) {
        self.name = name
        self.value = value
        self.specification = specification
    }
}
