//
//  TabBarPresenter.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/15/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import Foundation

class TabBarPresenter: NSObject {
    private(set)  weak var view: TabBarView!
    
    required init(_ view: TabBarView) {
        self.view = view
    }
}
