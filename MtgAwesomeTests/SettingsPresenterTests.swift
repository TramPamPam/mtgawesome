//
//  SettingsPresenterTests.swift
//  MtgAwesome
//
//  Created by Oleksandr Bezpalchuk on 8/10/17.
//  Copyright © 2017 TramPamPam. All rights reserved.
//

import XCTest
@testable import MtgAwesome

class SettingsPresenterTests: XCTestCase {
    
    class MockedSettingsView: SettingsView {
        var presenter: SettingsPresenter!
        
        func setPlayers(from source: PlayersDataSource) { }
    }
    
    var settingsPresenter = SettingsPresenter(MockedSettingsView())
    lazy var players: [Player] = PlayersService.createPlayers(4)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let view = MockedSettingsView()
        settingsPresenter = SettingsPresenter(view)
        players = PlayersService.createPlayers(4)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChangePlayer() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let view = MockedSettingsView()
        settingsPresenter = SettingsPresenter(view)

        XCTAssertNotNil(settingsPresenter.view, "No view!")

        
        let oldLife = players[0].life
//Change name only:
        let newName = "Name"
        settingsPresenter.changePlayer(at: 0, newName, nil)
        players = PlayersService.shared.players
        
        XCTAssert(oldLife == players[0].life, "Wrong lifes!\nsupposed: \(oldLife) current: \(players[0].life)")
        XCTAssert(newName == players[0].name, "Wrong names! supposed: \(newName) current: \(players[0].name)")

//Change life only:
        let newLife = 1
        let oldName = players[1].name
        settingsPresenter.changePlayer(at: 1, nil, newLife)
        players = PlayersService.shared.players
        
        XCTAssert(newLife == players[1].life, "Wrong lifes!\nsupposed: \(newLife) current: \(players[1].life)")
        XCTAssert(oldName == players[1].name, "Wrong names! supposed: \(oldName) current: \(players[1].name)")
        
//Change life and name:
        settingsPresenter.changePlayer(at: 2, newName, newLife)
        players = PlayersService.shared.players
        
        XCTAssert(newLife == players[2].life, "Wrong lifes!\nsupposed: \(newLife) current: \(players[2].life)")
        XCTAssert(newName == players[2].name, "Wrong names! supposed: \(newName) current: \(players[2].name)")
        
        let newValue = 10
//         _ = PlayersService.changePlayersNumber(newValue)
//        XCTAssert(PlayersService.shared.players.count == newValue, "supposed: \(newValue) current: \(PlayersService.shared.players.count)")
        
        XCTAssert(settingsPresenter.dataSource != nil, "No source!")
        
        
        
        settingsPresenter.changePlayersNumber(newValue)
        XCTAssert(PlayersService.shared.players.count == newValue, "supposed: \(newValue) current: \(PlayersService.shared.players.count)")

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
