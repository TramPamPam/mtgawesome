//
//  SettingsViewProtocol.swift
//  MtgAwesome
//
//  Created by ff on 8/9/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

protocol SettingsViewPresenter {
    init(_ view: SettingsView)
    func changePlayer(at index: Int, _ newName: String?, _ newLife: Int? )
    func changePlayersNumber(_ newValue: Int)
}

extension SettingsPresenter {
    func changePlayer(at index: Int, _ newName: String? = nil, _ newLife: Int? = nil) {
        guard PlayersService.shared.players.count > index else { return }
        if let name = newName {
            PlayersService.shared.players[index].name = name
        }
        if let life = newLife {
            PlayersService.shared.players[index].life = life
        }
    }
    
    func changePlayersNumber(_ newValue: Int) {
        //Update current view:
        _ = PlayersService.changePlayersNumber(newValue)
        view?.setPlayers(from: dataSource)
    }

}
