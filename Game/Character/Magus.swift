//
//  Magus.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation

class Magus: Character {
    // Properties
    let secondWeapon = MagicWand()

    // Init
    init(name: String) {
        super.init(name: name, type: "Mage", health: 300, weapon: Sword(value: 5))
    }

    convenience init() {
        self.init(name: "")
    }

    override func getDescription() -> String {
        let description = """
                        \(type): un magicien avec \(health) points de vie et une \(weapon.name) de force \(weapon.value).
                                 Il peut soigné un personnage de \(secondWeapon.value) points de vie
                        """
        return description
    }
    
    override func getDescriptionWithName() -> String {
        return "\(name), un \(type) : \(health) point de vie / attaque de \(weapon.value) / soin de \(secondWeapon.value)"
    }
}
