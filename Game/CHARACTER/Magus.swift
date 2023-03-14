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

    //
    override func showCharacterStatistic(inPosition position: Int) {
        if self.health > 0 {
        print("\(position). \(self.name), un \(self.type) : \(self.health) point de vie / attaque de \(self.weapon.value) / soin de \(self.secondWeapon.value)")
        } else {
            print("\(self.name) est mort")
        }
    }
}
