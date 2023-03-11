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
    let numberOfPlayerInTheGame = 1

    init() {
        initPlayer()
    }

    private func initPlayer() {
        for player in 0...numberOfPlayerInTheGame {
            print("quel est votre nom Joueur \(player+1)")
            let name = readLine() ?? ""

            let team = Player.getTeam()

            self.player.append(Player(name: name, team: team))
            print("joueur \(player+1) créé")
        }
    }
}
