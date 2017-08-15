//
//  TabBarViewPresenter.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/15/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import Foundation

protocol TabBarViewPresenter: class {
    init(_ view: TabBarView)
    func checkPlayersCount()
}

extension TabBarPresenter: TabBarViewPresenter {
    func checkPlayersCount() {
        view.showPlayers(with: PlayersService.shared.players.count)
    }
}
