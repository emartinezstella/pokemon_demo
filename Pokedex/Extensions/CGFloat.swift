//
//  CGFloat.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 11/07/23.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
