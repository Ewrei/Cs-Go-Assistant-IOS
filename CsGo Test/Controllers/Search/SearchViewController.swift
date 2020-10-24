//
//  SearchViewController.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit

final class SearchViewController: UIViewController, UISearchBarDelegate {
    
//    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if Preferences.shared.currentUser?.phoneNumber != nil {
//            loginButton.removeFromSuperview()
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
//    @IBAction func authAction(_ sender: Any) {
//        let authStoryboard = RoutingHelper.storyboard(.auth)
//        guard let vc = authStoryboard?.instantiateInitialViewController() as? AuthPhoneViewController else { return }
//        vc.isStartAuthentication = true
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @IBAction func locationAction(_ sender: Any) {
//        let locationStoryboard = RoutingHelper.storyboard(.location)
//        guard let vc = locationStoryboard?.instantiateInitialViewController() as? SelectCityViewController else { return }
//        vc.isStartAuthentication = true
//        navigationController?.pushViewController(vc, animated: true)
//    }
}
