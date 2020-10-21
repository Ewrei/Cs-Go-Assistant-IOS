//
//  Human.swift
//  CsGo Test
//
//  Created by Виталий on 9/28/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

class Human: NSObject {

    var firstName:  String  = ""
    var lastName:   String  = ""
    var age:        Int     = 0
    
    
    func getFullName() -> String
    {
        return "\(firstName) \(lastName)"
    }
    
    func getAge() -> String
    {
        return "I am \(age) years old"
    }
    
    func run()
    {
        print("I'm running")
    }
    
    func stopRun()
    {
        print("I stopped")
    }

}
