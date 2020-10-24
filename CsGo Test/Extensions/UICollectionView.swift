//
//  UICollectionView.swift
//  CsGo Test
//
//  Created by Виталий on 10/23/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func reloadDataAnimated(completion: (() -> Void)? = nil) {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.reloadData()
        }) { (isFinished) in
            if isFinished {
                completion?()
            }
        }
    }
}
