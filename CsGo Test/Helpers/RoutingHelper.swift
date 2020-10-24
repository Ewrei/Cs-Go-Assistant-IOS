//
//  RoutingHelper.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardType: String {
    case search = "Search"
    case main = "Main"
    case home = "Home"
}

final class RoutingHelper {
    static func makeRoot(storyboard: StoryboardType, vcIdentifier: String? = nil) {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let vc: UIViewController?

        if let id = vcIdentifier {
            vc = storyboard.instantiateViewController(withIdentifier: id)
        } else {
            vc = storyboard.instantiateInitialViewController()
        }

        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.5

        if let window = (UIApplication.shared.delegate as? AppDelegate)?.window {
            window.rootViewController = vc
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: { _ in })
        }
    }

    static func storyboard(_ type: StoryboardType) -> UIStoryboard? {
        return UIStoryboard(name: type.rawValue, bundle: nil)
    }
}
