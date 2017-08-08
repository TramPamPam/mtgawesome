//
//  PlayerCell.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/8/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var playersNameTextField: UITextField!
    @IBOutlet weak var lifeTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
