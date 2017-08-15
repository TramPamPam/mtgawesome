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
    
}
