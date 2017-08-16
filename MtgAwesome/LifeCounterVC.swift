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
    func updateLog(with source: LogDataSource)
}

protocol LifeCounterViewPresenter: class {
    init(_ view: LifeCounterView)
    func checkLife()
    func changeLife(with difference: Int) -> Int
}

class LifeCounterPresenter: LifeCounterViewPresenter {
    private(set) weak var view: LifeCounterView!

    private var life = 40
    fileprivate var entries: [LogEntry] = []
    
    var dataSource: LogDataSource! = LogDataSource()
    
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
        
        let newEntry = LogEntry(difference: difference, summary: life)
        
        entries.append(newEntry)
        dataSource.entries = entries

        view.updateLog(with: dataSource)

        return life
    }
}

class LogDataSource: NSObject, UITableViewDataSource {
    
    var entries: [LogEntry] = []

    convenience init(_ entries: [LogEntry]) {
        self.init()
        self.entries = entries
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LogCell", for: indexPath) as? LogCell{
            cell.logEntry = entries[indexPath.row]
            return cell
        }
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
    
    func updateLog(with source: LogDataSource) {
        logTableView.dataSource = source
        logTableView.reloadData()
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
