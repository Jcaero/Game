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
        fight()
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

        showPlayersTeam()
        /*
        for turn in 0...numberOfPlayerInTheGame-1 {
            print("\n\(self.player[turn].name), votre équipe est composée de:")
            self.player[turn].showPlayerTeam()
            if turn != numberOfPlayerInTheGame-1 {
                print("\ncontre")
            }
        }*/
    }

    // ask player for character type and charactere name
    // and stock in the Array team
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

    // show the character available
    // ask the player for the number of character type : 1, Warrior 2 Dwarf 3 Magus
    private func askForCharacterType() -> Int {
        Character.showCharacterList()
        return selectedNumber(to: 3)
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

    // start fight
    private func fight() {
        var attackingCharacter: Int
        var defensiveCharacter: Int
        var weaponValue: Int
        var weaponSpecification: WeaponSpecification = .attack

//        attackingPlayer = whoIsStarted()
 //       defensivePlayer = (attackingPlayer == 1) ? 0 : 1

        print("\n \(self.player[0].name) commence le jeu")

        repeat {
            print("\n\(self.player[0].name), vous pouvez attaquer avec:")
            attackingCharacter = selectCharacterAlive(player: self.player[0])
            print("vous avez selectionné \(self.player[0].team[attackingCharacter].name), un \(self.player[0].team[attackingCharacter].type)")

        if self.player[0].team[attackingCharacter].type == "Mage" {
        weaponSpecification = chooseWhichWeaponSpecification()
        }

        switch weaponSpecification {
        case .attack:
            weaponValue = self.player[0].team[attackingCharacter].weapon.value

            print("vous pouvez attaquer le personnage de \(self.player[1].name) suivant:")
            defensiveCharacter = selectCharacterAlive(player: self.player[1])
            print("vous avez selectionné \(self.player[1].team[defensiveCharacter].name), un \(self.player[1].team[defensiveCharacter].type)")

            self.player[1].team[defensiveCharacter].beAttackWithValue(valeur: weaponValue )

        case .care:
            print("vous pouvez soigner le personnage suivant:")
            attackingCharacter = selectCharacterAlive(player: self.player[0])
            print("vous avez selectionné \(self.player[0].team[attackingCharacter].name), un \(self.player[0].team[attackingCharacter].type)")
            self.player[0].team[attackingCharacter].beCare()
            weaponSpecification = .attack
        }

            self.player.swapAt(0, 1)
        }while self.player[0].isAlive()
        showPlayersTeam()
    }

    // choose witch player start
    // return number of attack
    private func whoIsStarted() -> Int {
        return Int.random(in: 0..<2)
    }

    // selected character alive during the fight
    // return position in the Array
    private func selectCharacterAlive(player: Player) -> Int {
        var number: Int
        player.showPlayerTeam()
        print("Sélectionner votre personnage")
        number = selectedNumber(to: 3)
        if player.team[number-1].health == 0 {
            print("le joueur selectionné est mort, merci de choisir un autre joueur")
            return selectCharacterAlive(player: player)
        }
        return number-1
    }

    // selected weapon specification care or attack
    private func chooseWhichWeaponSpecification() -> WeaponSpecification {
        print("""
            vous voulez soigner ou attaquer ?
                1. soigner
                2. attaquer
            """)
        switch selectedNumber(to: 2) {
        case 1: return .care
        case 2: return .attack
        default: return .attack
        }
    }

    // check if player give a right number between 1 to number
    private func selectedNumber(to number: Int) -> Int {
        let readNumber = Int(readLine() ?? "") ?? 0
        if (readNumber == 0)||(readNumber > number) {
            print("nombre non valide")
            return selectedNumber(to: number)
            }
        return readNumber
    }

    // show player team
    func showPlayersTeam() {
        for turn in 0...numberOfPlayerInTheGame-1 {
            print("\n\(self.player[turn].name), votre équipe est composée de:")
            self.player[turn].showPlayerTeam()
            if turn != numberOfPlayerInTheGame-1 {
                print("\ncontre")
            }
        }
    }
}
