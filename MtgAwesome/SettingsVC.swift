//
//  SettingsVC.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/8/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, UITextFieldDelegate, SettingsView {
    
    @IBOutlet weak var playersCountTextField: UITextField!
    @IBOutlet weak var playersTableView: UITableView!

    var presenter: SettingsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SettingsPresenter(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newText = textField.text else { return }
        if textField == playersCountTextField {
            if let value = Int(newText) {
                presenter.changePlayersNumber(value)
                playersTableView.reloadData()
            }
        } else {
            if textField.tag < 100 {
                presenter.changePlayer(at: textField.tag, textField.text)
            } else {
                presenter.changePlayer(at: textField.tag-100, nil, Int(newText))
            }
        }
        
    }
    
}

