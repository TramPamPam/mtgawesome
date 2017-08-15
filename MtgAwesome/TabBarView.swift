//
//  TabBarView.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/15/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

protocol TabBarView: class {
    func showPlayers(with count: Int)
}

extension TabBarController: TabBarView {
    func showPlayers(with count: Int = 1) {
        var views:[UIViewController] = []
        for i in 0..<count {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LifeCounterVC")
            vc.title = "Player \(i)"
            views.append(vc)
        }
        setViewControllers(views, animated: false)
    }
}
