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

    // Init of the player:
    // ask for name , ask for team and create player
    private func initPlayer() {
        for turn in 0...numberOfPlayerInTheGame-1 {
            print("\nQuel est votre nom Joueur \(turn+1)")
            let name = getPlayerName()
            print("\nBonjour \(name)")

            let team = getTeam()

            self.player.append(Player(name: name, team: team))
            print("\(name), votre équipe est complète")
        }

        print("\nJeu initialisé, voici les équipes")
        for turn in 0...numberOfPlayerInTheGame-1 {
            self.player[turn].showPlayerTeam()
            if turn != numberOfPlayerInTheGame-1 {
                print("\ncontre")
            }
        }
    }

    // ask player for character type and charactere name
    // and stock in the Array team
    // player can choose numberOfCharacterInTeam character in a team
    private func getTeam() -> [Character] {
        var team = [Character]()

        for turn in 0...numberOfCharacterInTeam-1 {
            print("veuillez choisir votre personnage numero \(turn+1)")
            let charactereType = askForCharacterType()
            print("veuillez choisir le nom du personnage")
            let charactereName = askForCharacterName()

            switch charactereType {
            case 1 : team.append(Warrior(name: charactereName))
            case 2 : team.append(Dwarf(name: charactereName))
            case 3 : team.append(Magus(name: charactereName))
            default: print("erreur ")
            }
            print("vous avez crée \(team[turn].name) de type \(team[turn].type)")
        }
        return team
    }

    // ask the player for the number of character type : 1, Warrior 2 Dwarf 3 Magus
    private func askForCharacterType() -> Int {
        var selectedNumber: Int
        repeat {
            Character.showCharacterList()
            selectedNumber = Int(readLine() ?? "") ?? 0
            if (selectedNumber == 0)||(selectedNumber > 3) {
                print("erreur de saisie")
            }
        }while ( selectedNumber == 0)||( selectedNumber > 3)
        return selectedNumber
    }

    // ask to the player for the name of the character
    private func askForCharacterName() -> String {
        let name = readLine() ?? ""
        guard name != "" else {
            print("erreur de saisie, recommencer")
            return askForCharacterName()
        }
        guard Character.names.isEmpty == false else {
            Character.names.append(name.lowercased())
            return name
        }
        for storedName in Character.names where storedName == name.lowercased() {
            print("nom déja utilisé, merci de choisir un autre nom")
            return askForCharacterName()
        }
        Character.names.append(name.lowercased())
        return name
    }

    // ask player for his name
    // check if player insert a name and if this name is not used by other player
    private func getPlayerName() -> String {
        let name = readLine() ?? ""
        guard name != "" else {print("erreur de saisie, recommencer"); return getPlayerName()}
        guard self.player.isEmpty == false else {return name}
        for character in self.player where character.name.lowercased() == name.lowercased() {
            print("nom déja utilisé, merci de choisir un autre nom")
            return getPlayerName()
        }
        return name
    }
}
