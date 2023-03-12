//
//  Game.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation

class Game {
    // Propreties
    var player = [Player]()
    let numberOfPlayerInTheGame = 2
    let numberOfCharacterInTeam = 3

    init() {
        initPlayer()
    }

    // Init of the player: ask for name , ask for team and create player
    private func initPlayer() {
        for player in 0...numberOfPlayerInTheGame-1 {
            print("quel est votre nom Joueur \(player+1)")
            let name = readLine() ?? ""

            let team = getTeam()

            self.player.append(Player(name: name, team: team))
            print("joueur \(player+1) créé")
        }
    }

    // ask player for character type and charactere name
    // and stock in the Array team
    // player can choose numberOfCharacterInTeam character in a team
    private func getTeam() -> [Character] {
        var team = [Character]()

        for tour in 0...numberOfCharacterInTeam-1 {
            print("veuillez choisir votre personnage numero \(tour+1)")
            let charactereType = askForCharacterType()
            print("veuillez choisir le nom du personnage")
            let charactereName = askForCharacterName()

            switch charactereType {
            case 1 : team.append(Warrior(name: charactereName))
            case 2 : team.append(Dwarf(name: charactereName))
            case 3 : team.append(Magus(name: charactereName))
            default: print("erreur ")
            }
            print("vous avez crée \(team[tour].name) de type \(team[tour].type)\n")
        }
        return team
    }

    // ask the player for the number of character type : 1, Warrior 2 Dwarf 3 Magus
    private func askForCharacterType() -> Int {
        var selectedNumber: Int
        repeat {
        Character.showCharacterList()
        selectedNumber = Int(readLine() ?? "") ?? 0
        if (selectedNumber == 0)||(selectedNumber > 3) {print("erreur de saisie")}
        }while ( selectedNumber == 0)||( selectedNumber > 3)
        return selectedNumber
    }

    // ask to the player for the name of the character
    private func askForCharacterName() -> String {
        let name = readLine() ?? ""
        return name
    }

}
