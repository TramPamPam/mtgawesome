//
//  SettingsPresenter.swift
//  MtgAwesome
//
//  Created by ff on 8/9/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

class SettingsPresenter: SettingsViewPresenter {
    private(set) weak var view: SettingsView?
    
    var dataSource: PlayersDataSource! = PlayersDataSource()
    
    required init(_ view: SettingsView) {
        self.view = view
        view.setPlayers(from: dataSource)
    }
    
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
