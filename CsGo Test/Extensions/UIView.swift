//
//  UIView.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func loadNib() -> UIView
    {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func makeRedBlink() {
        let blinkView = UIView()
        blinkView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        blinkView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blinkView)
        blinkView.frame = bounds
        blinkView.clipsToBounds = true
        blinkView.isUserInteractionEnabled = false
        blinkView.layer.cornerRadius = 10
        blinkView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            blinkView.alpha = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.animate(withDuration: 0.3, animations: {
                blinkView.alpha = 0
            })
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            blinkView.removeFromSuperview()
        }
    }
    
    func shake(offset: CGFloat = 20) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-offset, offset, -offset, offset, -offset / 2, offset / 2, -offset / 4, offset / 4, offset / 4]
        layer.add(animation, forKey: "shake")
    }
}
