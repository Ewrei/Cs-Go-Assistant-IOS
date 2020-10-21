//
//  FirstViewController.swift
//  CsGo Test
//
//  Created by Виталий on 9/13/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

class FirstViewController:
UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonTouch(sender: AnyObject) {
        // 1
        let alert = UIAlertController(title: "Hello", message: "My name is World!", preferredStyle: .alert)
        
        // 2
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionCancel);
        
        // 3
        self.present(alert, animated: true, completion: nil)
    }
}
