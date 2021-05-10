//
//  CustomSlider.swift
//  AttackOnPhobia
//
//  Created by Reza Harris on 03/05/21.
//

import UIKit

class CustomSlider: UISlider {

    @IBInspectable open var trackWidth:CGFloat = 2 {
            didSet {setNeedsDisplay()}
        }
        override open func trackRect(forBounds bounds: CGRect) -> CGRect {
            let defaultBounds = super.trackRect(forBounds: bounds)
            return CGRect(
                x: defaultBounds.origin.x,
                y: defaultBounds.origin.y + defaultBounds.size.height/2 - trackWidth/2,
                width: defaultBounds.size.width,
                height: 30
            )  }

}
