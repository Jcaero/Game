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

    // return generique description of the character
    func getDescription() -> String {
        return "\(type): un combatant avec \(health) points de vie et une \(weapon.name) de force \(weapon.value)"
    }

    // show statistic of an particular charactere
    func getDescriptionWithName() -> String {
        return "\(name), un \(type) : \(health) point de vie / attaque de \(weapon.value)"
    }

    // change the value of health
    func beAttacked(by character: Character) {
        let value = character.weapon.value

        if health <= value {
            health = 0
            print("\(name) a été attaqué par \(character.name) et il est mort")
        } else {
            health -= value
            print("\(name) a été attaqué par \(character.name) et il a perdu \(value) points de vie")
        }
    }

    // be care with value 8
    func beCare() {
        health += 8
        print("\(name) a été soigné et gagne 8 points de vie")
    }

}
