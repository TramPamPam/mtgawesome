//
//  PlayersService.swift
//  MtgAwesome
//
//  Created by ff on 8/9/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import Foundation

class PlayersService {
    
    static let shared = PlayersService()
    
    var players: [Player] = []
    
    class func createPlayers(_ count: Int = 4) -> [Player] {
        for i in 0..<count {
            PlayersService.shared.players.append(Player(name: "Player \(i)", life: 40))
        }
        return PlayersService.shared.players
    }
    
    class func changePlayersNumber(_ count: Int = 0) -> [Player] {
        var players = PlayersService.shared.players
        if (count < players.count) {
            players = Array(players.prefix(count))
        } else {
            for i in players.count..<count {
                players.append(Player(name: "Player \(i)", life: 40))
            }
        }
        PlayersService.shared.players = players
        return PlayersService.shared.players
    }
    
}
