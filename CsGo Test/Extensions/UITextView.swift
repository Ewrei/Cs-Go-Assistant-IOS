//
//  UITextView.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func renderTextAsHtml(_ text: String?) {
        guard let text = text else { return }

        if let attributedString = text.asHtmlAttributedText?.mutableCopy() as? NSMutableAttributedString {
            attributedString.addAttributes([NSAttributedString.Key.foregroundColor: self.textColor as Any], range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
