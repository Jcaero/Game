//
//  Game.swift
//  Game
//
//  Created by pierrick viret on 11/03/2023.
//

import Foundation

class Game {
    // Propreties
    var players = [Player]()
    let numberOfPlayerInTheGame = 2
    let numberOfCharacterInTeam = 3

    init() {
        initPlayer()
        fight()
    }

    // Init of the player:
    // ask for name , ask for team and create player
    private func initPlayer() {
        let maxPlayer = numberOfPlayerInTheGame - 1
        for index in 0...maxPlayer {
            print("\nQuel est votre nom Joueur \(index + 1)")

            let name = getPlayerName()
            print("\nBonjour \(name)")

            let team = getTeam()

            self.players.append(Player(name: name, team: team))
            print("\(name), votre équipe est complète")
        }

        print("\nJeu initialisé, voici les équipes")

        displayPlayersTeam()
    }

    // start fight
    private func fight() {
        whoIsStarted()

        var attacker = players[0]
        var attacked = players[1]

        repeat {
            print("\n\(attacker.name), vous pouvez attaquer avec:")
            let offensiveCharacter = getAliveCharacter(from: attacker)

            var weaponSpecification: WeaponSpecification = .attack
            if offensiveCharacter.type == "Mage" {
                weaponSpecification = chooseWhichWeaponSpecification()
            }

            switch weaponSpecification {
            case .attack:
                print("vous pouvez attaquer le personnage de \(attacked.name) suivant:")
                let defensiveCharacter = getAliveCharacter(from: attacked)
                defensiveCharacter.beAttacked(by: offensiveCharacter)

            case .care:
                print("vous pouvez soigner le personnage suivant:")
                let offensiveCharacter = getAliveCharacter(from: attacker)
                offensiveCharacter.beCare()
            }

            players.swapAt(0, 1)
            attacker = players[0]
            attacked = players[1]

        } while attacker.isAlive()

        print("\(attacked.name) gagne la partie ")
    }

    // ask player for character type and charactere name
    // and stock in the Array team
    private func getTeam() -> [Character] {
        var team = [Character]()
        let maxCharacter = numberOfCharacterInTeam - 1

        for index in 0...maxCharacter {
            print("veuillez choisir votre personnage numero \(index + 1)")
            let charactereType = getCharacterType()

            print("veuillez choisir le nom du personnage")
            let charactereName = askForCharacterName()

            switch charactereType {
            case "Guerrier" : team.append(Warrior(name: charactereName))
            case "Nain" : team.append(Dwarf(name: charactereName))
            case "Mage" : team.append(Magus(name: charactereName))
            default: print("erreur ")
            }
            print("vous avez crée \(team[index].name) de type \(team[index].type)")
        }
        return team
    }

    // show the character available
    // ask the player for the number of character
    private func getCharacterType() -> String {
        let characters = [Warrior(), Dwarf(), Magus()]

        for (index, character) in characters.enumerated() {
            let description = character.getDescription()
            print("\(index + 1). \(description)")
        }
        let selection = getNumber(withMax: characters.count) - 1
        let type = characters[selection].type
        return type
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

        guard name.isEmpty == false else {
            print("erreur de saisie, recommencer")
            return getPlayerName()
        }

        for character in self.players where character.name.lowercased() == name.lowercased() {
            print("nom déja utilisé, merci de choisir un autre nom")
            return getPlayerName()
        }

        return name
    }

    // choose witch player start
    // and the name is shown on the screen
    private func whoIsStarted() {
        if Bool.random() {
            players.swapAt(0, 1)
        }
        print("\n \(players[0].name) commence le jeu")
    }

    // FUNC selected character alive during the fight
    // show character alive
    // identifie the number of charater alive and player can only select the number
    // return position in the Array
    private func getAliveCharacter(from player: Player) -> Character {

        player.showPlayerTeamAlive()
        let number = player.nombreOfCharacterAlive()

        print("Sélectionner votre personnage")
        let index = getNumber(withMax: number) - 1

        print("vous avez selectionné \(player.team[index].name), un \(player.team[index].type)")
        return player.team[index]
    }

    // FUNC selected weapon specification
    // player select number
    // return care or attack
    private func chooseWhichWeaponSpecification() -> WeaponSpecification {
        print("""
            vous voulez soigner ou attaquer ?
                1. soigner
                2. attaquer
            """)

        let choice = getNumber(withMax: 2)
        return WeaponSpecification(rawValue: choice)!
    }

    // check if player give a right number between 1 to number
    private func getNumber(withMax number: Int) -> Int {
        let readNumber = Int(readLine() ?? "") ?? 0

        if (readNumber == 0) || (readNumber > number) {
            print("nombre non valide")
            return getNumber(withMax: number)
        }

        return readNumber
    }

    // display players team before the game start
    private func displayPlayersTeam() {
        let maxPlayers = numberOfPlayerInTheGame - 1

        for index in 0...maxPlayers {
            print("\n\(players[index].name), votre équipe est composée de:")
            players[index].showPlayerTeam()
            if index != maxPlayers {
                print("\ncontre")
            }
        }
    }
}
