//
//  TabBarController.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/14/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    lazy var presenter: TabBarPresenter = {
        return TabBarPresenter(self)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.checkPlayersCount()
    }
}


