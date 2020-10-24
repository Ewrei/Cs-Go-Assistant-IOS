//
//  UILabel.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit

extension UILabel
{
    func streaked()
    {
        guard let text = text else { return }
        guard let textFont = font else { return }
        guard let textColor = textColor else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughColor, value: textColor, range: NSMakeRange(0, attributedString.length))
        attributedString.addAttributes([
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
        ], range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
    }
}
