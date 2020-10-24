//
//  UIColor.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init?(hex: String?) {
        guard let hex = hex else { return nil }

        let r, g, b: CGFloat

        var hexColor = "FFFFFF"

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            hexColor = String(hex[start...])
        } else {
            hexColor = hex
        }

        if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
                g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
                b = CGFloat(hexNumber & 0x0000FF) / 255.0

                self.init(displayP3Red: r, green: g, blue: b, alpha: 1.0)
                return
            }
        }

        return nil
    }

    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        return String(format: "#%06x", rgb)
    }
}
