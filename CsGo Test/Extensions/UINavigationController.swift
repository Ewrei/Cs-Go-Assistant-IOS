//
//  UINavigationController.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit


extension UINavigationController {
    func pop(backSteps: Int, animated: Bool) {
        let viewControllers: [UIViewController] = self.viewControllers as [UIViewController]
        let backCount = backSteps + 1
        popToViewController(viewControllers[viewControllers.count - backCount], animated: animated)
    }
}
