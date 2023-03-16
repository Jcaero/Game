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
    var team: [Character]

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

    // show all of the player team alive
    func showPlayerTeamAlive() {
        organizeCharacterInTeam()
        showPlayerTeam()
    }

    // Put the dead character in the end of the array
    func organizeCharacterInTeam() {
        var index = 0
        for character in self.team {
            if character.health == 0 {
            let removeCharacter = self.team[index]
            self.team.remove(at: index)
            self.team.append(removeCharacter)
            return
            }
            index += 1
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

    // return number of character alive
    func nombreOfCharacterAlive() -> Int {
        var number = 0
        for character in self.team where character.health != 0 {
            number += 1
        }
        return number
    }
}
