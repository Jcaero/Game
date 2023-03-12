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
    override func showCharacterStatistic() {
        super.showCharacterStatistic()
        print("capacité de soin de \(self.secondWeapon.value) points de vie avec sa \(self.secondWeapon.name)")
    }
}
