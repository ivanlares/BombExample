//
//  Global.swift
//  BombExample
//
//  Created by ivan lares on 3/9/16.
//  Copyright © 2016 ivan lares. All rights reserved.
//

import UIKit

enum Layer: CGFloat {
    case Background
    case Bomb
    case ScreenEffect
  
}

struct PhysicsCategory {
    static let None:UInt32 = 0          // 0
    static let Log:UInt32 = 0x1         // 1
    static let Player:UInt32 = 0x1 << 1 // 2
    static let Fruit1:UInt32 = 0x1 << 2 // 4
    static let Fruit2:UInt32 = 0x1 << 3 // 8
    static let Fruit3:UInt32 = 0x1 << 4 // 16
    static let Bomb:UInt32 = 0x1 << 5   // 32
}
