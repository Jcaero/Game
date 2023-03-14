//
//  Player.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation

class Player {
    // Properties
    let name: String
    let team: [Character]

    // INIT
    init(name: String, team: [Character]) {
        self.name = name
        self.team = team
    }

    // show all of the player team
    func showPlayerTeam() {
        var position = 1
        for character in self.team {
            character.showCharacterStatistic(inPosition: position)
            position += 1
        }
    }

    // check if player have at least one character alive
    func isAlive() -> Bool {
        var result = false
        for character in self.team where character.health > 0 {
            result = true
        }
        return result
    }
}
