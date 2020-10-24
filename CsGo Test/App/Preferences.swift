//
//  Preferences.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation

final class Preferences {
    static let shared = Preferences()
    private init() {}
    
    var isLogged: Bool {
        return playerId != nil
    }

    var playerId: String? {
        get { return UserDefaults.standard.string(forKey: "playerId") }
        set { UserDefaults.standard.set(newValue, forKey: "playerId") }
    }
    
    var sessionId: String? {
        get { return UserDefaults.standard.string(forKey: "sessionId") }
        set { UserDefaults.standard.set(newValue, forKey: "sessionId") }
    }
    
    func clearAll() {
        playerId = nil
    }
}
