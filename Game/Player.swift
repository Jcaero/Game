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

    func showPlayerTeam() {
        print("\n\(self.name), votre équipe est composée de:")
        for character in self.team {
            character.showCharacterStatistic()
        }
    }
}
