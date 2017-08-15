//
//  PlayersDataSource.swift
//  MtgAwesome
//
//  Created by ff on 8/9/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

class PlayersDataSource: NSObject, UITableViewDataSource {
    
    var playersCount: Int {
        return PlayersService.shared.players.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerCell {
            cell.playersNameTextField.text = PlayersService.shared.players[indexPath.row].name
            cell.playersNameTextField.tag = indexPath.row
            
            cell.lifeTextField.text = "\(PlayersService.shared.players[indexPath.row].life)"
            cell.lifeTextField.tag = indexPath.row + 100
            
            return cell
        }
        
        return UITableViewCell()
    }
}
