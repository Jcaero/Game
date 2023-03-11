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
    static let numberOfCharacterInTeam = 3

    // INIT
    init(name: String, team: [Character]) {
        self.name = name
        self.team = team
    }

    static func getTeam() -> [Character] {
        var team = [Character]()
        let numberOfCharacter = ["Premier", "Second", "Troisième"]

        for tour in 0...numberOfCharacterInTeam-1 {
            print("veuillez choisir votre \(numberOfCharacter[tour]) personnage")
            let charactereType = askForCharacterType()
            print("veuillez choisir le nom du personnage")
            let charactereName = askForCharacterName()

            switch charactereType {
            case 1 : team.append(Warrior(name: charactereName))
            case 2 : team.append(Dwarf(name: charactereName))
            case 3 : team.append(Magus(name: charactereName))
            default: ""
            }
            print("vous avez choisi \(team[tour].name) de type \(team[tour].type)\n")
        }

        return team
    }

    // ask the player for the number of character type : 1, Warrior 2 Dwarf 3 Magus
    static func askForCharacterType() -> Int {
        var selectedNumber: Int
        repeat {
        Character.showCharacterList()
        selectedNumber = Int(readLine() ?? "") ?? 0
        if (selectedNumber == 0)||(selectedNumber > 3) {print("erreur de saisie")}
        }while ( selectedNumber == 0)||( selectedNumber > 3)
        return selectedNumber
    }

    // ask to the player for the name of the character
    static func askForCharacterName() -> String {
        let name = readLine() ?? ""
        return name
    }

}
