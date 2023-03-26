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

    // statistic during a game
    var turn: Int = 0
    var careTurn: Int = 0
    var attackturn: Int { return turn - careTurn }
    var strength: Int = 0

    // INIT
    init(name: String, team: [Character]) {
        self.name = name
        self.team = team
    }

    // show all of the player team
    func showTeam() {
        for (index, character) in team.enumerated() {
            let description = character.getDescriptionWithName()
            print("\(index + 1). \(description)")
        }
    }

    // put dead people at the bottom of the array
    // display alive character
    func showTeamAlive() {
        organizeCharacterInTeam()

        for (index, character) in team.enumerated() where character.health != 0 {
            let description = character.getDescriptionWithName()
            print("\(index + 1). \(description)")
        }
    }

    // Put the dead character in the end of the array
    private func organizeCharacterInTeam() {
        for (index, character) in team.enumerated() where character.health == 0 {
                let removeCharacter = team[index]
                team.remove(at: index)
                team.append(removeCharacter)
                return
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

    // upgrade statistic
    func increaseStratistic(with heal: Bool, value: Int) {
        turn += 1
        switch heal {
        case true: careTurn += 1
        case false: strength += value
        }
    }
}
