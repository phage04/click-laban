//
//  Player.swift
//  Click Laban
//
//  Created by Lyle Christianne Jover on 07/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import Foundation

class Player {
    
    private var _hp: Int = 100
    var attackPwr: Int = 0
    
//    var attackPwr: Int {
//        get {
//            return _attackPwr[Int(arc4random_uniform(3))]
//        }
//    }

    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0{
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int) {
        self._hp = startingHp
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
}