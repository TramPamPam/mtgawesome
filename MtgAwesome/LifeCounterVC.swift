//
//  LifeCounterVC.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/11/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

protocol LifeCounterView: class {
    func showLife(_ life: Int)
}

protocol LifeCounterViewPresenter: class {
    init(_ view: LifeCounterView)
    func checkLife()
    func changeLife(with difference: Int) -> Int
}

class LifeCounterPresenter: LifeCounterViewPresenter {
    private(set) weak var view: LifeCounterView!

    private var life = 40
    private var differences:[Int] = []
    private var summaries:[Int] = []
    
    required init(_ view: LifeCounterView) {
        self.view = view
    }

    func checkLife() {
        view.showLife(life)
    }
    
    func changeLife(with difference: Int) -> Int {
        if life < 0 {
            return 0
        }
        
        life += difference
        differences.append(difference)
        summaries.append(life)
        return life
    }
}

class LogDataSource: NSObject, UITableViewDataSource {
    
    private var differences:[Int] = []
    private var summaries:[Int] = []
    
    convenience init(with differences: [Int], summaries: [Int] ) {
        self.init()
        self.differences = differences
        self.summaries = summaries
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return differences.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        return UITableViewCell()
    }
}


class LifeCounterVC: UIViewController, LifeCounterView {
    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var plusOneButton: UIButton!
    @IBOutlet weak var minusOneButton: UIButton!
    @IBOutlet weak var plusFiveButton: UIButton!
    @IBOutlet weak var minusFiveButton: UIButton!

    @IBOutlet weak var logTableView: UITableView!
    
    @IBOutlet weak var commanderSwitch: UISwitch!
    
    lazy var presenter: LifeCounterPresenter! = {
        return LifeCounterPresenter(self)
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarItem.title = title
        presenter.checkLife()
    }
    
    func showLife(_ life: Int) {
        totalButton.setTitle("\(life)", for: .normal)
    }
    
    @IBAction func lifeChangeAction(_ sender: UIButton) {
        switch sender {
        case minusOneButton:
            showLife(presenter.changeLife(with: -1))
        case plusFiveButton:
            showLife(presenter.changeLife(with: 5))
        case minusFiveButton:
            showLife(presenter.changeLife(with: -5))
        default:
            showLife(presenter.changeLife(with: 1))
        }
    }
    
    
}
