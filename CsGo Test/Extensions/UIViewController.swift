//
//  UIViewController.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController {
    func openUrl(_ url: URL?) {
        guard let url = url else { return }
        let safariController = SFSafariViewController(url: url)
        present(safariController, animated: true)
    }

    func showAlert(title: String?, message: String?, handler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
                handler?()
            })
            self.present(alert, animated: true)
        }
    }

    func showError(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    func showActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
        return activityIndicator
    }
}
