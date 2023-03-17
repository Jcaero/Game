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

    static var names: [String] = []

    // INIT
    init(name: String, type: String, health: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.health = health
        self.weapon = weapon
    }

    // print the available charatere in the game
    static func showCharacterList() {
        print("1. Warrior: un combatant avec 100 points de vie et une épée de force 10")
        print("2. Dwarf: un nain avec 50 points de vie et une hache de force 30")
        print("3. Magus: un mage avec 300 points de vie et une épée de 5 points")
        print("          il peut soigner de 8 points de vie un personnage avec sa baguette magique")
    }

    // show statistic of the charactere
    func showCharacterStatistic(inPosition position: Int) {
        if self.health > 0 {
        print("\(position). \(self.name), un \(self.type) : \(self.health) point de vie / attaque de \(self.weapon.value)")
        }/* else {
        print("\(self.name) est mort")
        }*/
    }

    // be attack with a weapon value
    func beAttackWithValue(valeur: Int) {
        if self.health <= valeur {
            self.health = 0
        } else {
            self.health -= valeur
        }
    }

    // be care with Magus
    func beCare() {
        self.health += 8
    }

}
