//
//  SettingsVC.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/8/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

protocol SettingsView: class {
    func setPlayers(_ newSource: PlayersDataSource)
}

protocol SettingsViewPresenter  {
    init(_ view: SettingsView)
    func changeNumber(_ newValue: Int)
}

class SettingsVC: UIViewController, UITextFieldDelegate, SettingsView {
    
    @IBOutlet weak var playersCountTextField: UITextField!
    @IBOutlet weak var playersTableView: UITableView!

    var presenter: SettingsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = SettingsPresenter(self)
    }
    
    func setPlayers(_ newSource: PlayersDataSource) {
        playersCountTextField.text = "\(newSource.players.count)"
        playersTableView.dataSource = newSource
        playersTableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let newText = textField.text, let value = Int(newText) {
            presenter.changeNumber(value)
            playersTableView.reloadData()
        }
    }
}

class SettingsPresenter: SettingsViewPresenter {
    unowned let view: SettingsView
    
    var dataSource: PlayersDataSource! = PlayersDataSource()
    
    required init(_ view: SettingsView) {
        self.view = view
    }
    
    func changeNumber(_ newValue: Int) {
        dataSource = PlayersDataSource(newValue)
        view.setPlayers(dataSource)
    }
}

class PlayersDataSource: NSObject, UITableViewDataSource {
    
    var players: [String]! = []
    
    required init(_ playersCount: Int = 0) {
        for i in 0..<playersCount {
            players.append("Player \(i+1)")
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerCell {
            cell.playersNameTextField.text = players[indexPath.row]
            cell.lifeTextField.text = "40"
        }
        
        return UITableViewCell()
    }

}
