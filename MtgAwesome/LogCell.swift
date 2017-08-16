//
//  LogCell.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/16/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import UIKit

struct LogEntry {
    var difference: Int
    var summary: Int
}

class LogCell: UITableViewCell {

    @IBOutlet private weak var differenceLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
 
    var logEntry: LogEntry! {
        didSet {
            if logEntry.difference > 0 {
                differenceLabel.text = "\(logEntry.summary-logEntry.difference) + \(logEntry.difference)"
                contentView.backgroundColor = UIColor(red: 204/255, green: 1, blue: 204/255, alpha: 1)
            } else {
                differenceLabel.text = "\(logEntry.summary-logEntry.difference) - \(abs(logEntry.difference))"
                contentView.backgroundColor = UIColor(red: 1, green: 204/255, blue: 204/255, alpha: 1)

            }
            summaryLabel.text = " = \(logEntry.summary)"
        }
    }
    
}
