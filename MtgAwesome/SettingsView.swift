//
//  SettingsView.swift
//  MtgAwesome
//
//  Created by ff on 8/9/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

protocol SettingsView: class {
    var presenter: SettingsPresenter! { get set }
    
    func setPlayers(from source: PlayersDataSource)
}

extension SettingsVC {
    
    func setPlayers(from source: PlayersDataSource) {
        playersCountTextField.text = "\(PlayersService.shared.players.count)"
        playersTableView.dataSource = source
        playersTableView.reloadData()
    }
}
