//
//  MainController.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

final class MainController: UITabBarController {
    fileprivate var shoppingCartNavigationController: UINavigationController {
        return viewControllers?[1] as! UINavigationController
    }

    fileprivate var shoppingCartBarItem: UITabBarItem {
        return shoppingCartNavigationController.tabBarItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(shoppingCartUpdated), name: .shoppingCartUpdated, object: nil)
    }

//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    @objc func shoppingCartUpdated(notification: Notification) {
//        guard let orderModel = notification.object as? OrderModel else {
//            shoppingCartBarItem.badgeValue = nil
//            return
//        }
//        refreshBadgeValue(order: orderModel)
//    }
//
//    fileprivate func refreshBadgeValue(order: OrderModel) {
//        shoppingCartBarItem.badgeValue = order.items.count == 0 ? nil : "\(order.items.count)"
//    }
}
