//
//  SettingsViewProtocol.swift
//  MtgAwesome
//
//  Created by ff on 8/9/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

protocol SettingsViewPresenter  {
    init(_ view: SettingsView)
    func changePlayer(at index: Int, _ newName: String?, _ newLife: Int?)
    func changePlayersNumber(_ newValue: Int)
}
