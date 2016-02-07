//
//  ViewController.swift
//  Click Laban
//
//  Created by Lyle Christianne Jover on 07/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enemyAttackBtn: UIButton!
    @IBOutlet weak var enemyAttackLbl: UILabel!
    @IBOutlet weak var playerAttackBtn: UIButton!
    @IBOutlet weak var playerAttackLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var playerHPLbl: UILabel!
    @IBOutlet weak var whoWinsLbl: UILabel!
    
    var player: Redford!
    var enemy: Babalu!
    var _attackPwr: [Int] = [0,5,15,50]
    var nowAttackPwr: Int!
    var timeDelayTimeRnd: UInt32 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Redford(startingHp: 100)
        enemy = Babalu(startingHp: 100)
        
        playerHPLbl.text = "\(player.hp) HP"
        enemyHPLbl.text = "\(enemy.hp) HP"
        whoWinsLbl.text = ""
        showAttackButtons()
        playerImg.hidden = false
        enemyImg.hidden = false
        infoLbl.text = "KILL EACH OTHER!!!"
        
    }
    

    
    func showAttackButtons () {
        
        playerAttackBtn.hidden = false
        playerAttackLbl.hidden  = false
        enemyAttackBtn.hidden = false
        enemyAttackLbl.hidden  = false
        
    }
    
    func hideAttackButtons () {
        playerAttackBtn.hidden = true
        playerAttackLbl.hidden  = true
        enemyAttackBtn.hidden = true
        enemyAttackLbl.hidden  = true
    }
    
    func hideAll (){
        playerAttackBtn.hidden = true
        playerAttackLbl.hidden  = true
        enemyAttackBtn.hidden = true
        enemyAttackLbl.hidden  = true
        playerImg.hidden = true
        enemyImg.hidden = true
        playerHPLbl.text = ""
        enemyHPLbl.text = ""
    }
    
    func timeDelay (sec: Double) {
        var secNow: Double = 1
        secNow += sec
        NSTimer.scheduledTimerWithTimeInterval(secNow, target: self, selector: "showAttackButtons", userInfo: nil, repeats: false)
        
    }
    
    func Restart (sec: Double) {
        NSTimer.scheduledTimerWithTimeInterval(sec, target: self, selector: "viewDidLoad", userInfo: nil, repeats: false)
        
    }
    
    func generateAttackPwr () {
        
       nowAttackPwr = _attackPwr[Int(arc4random_uniform(4))]
        
    }
    
    @IBAction func enemyAttackPressed(sender: AnyObject) {
        
        hideAttackButtons()
        generateAttackPwr()
        
        if player.attemptAttack(nowAttackPwr) {
            
            if nowAttackPwr != 0 && nowAttackPwr != _attackPwr[3] {
            
            infoLbl.text = "\(enemy.name) attacked \(player.name) for \(nowAttackPwr) HP"
            playerHPLbl.text = "\(player.hp) HP"
                
            }else if nowAttackPwr == _attackPwr[3] {
                
            infoLbl.text = "CRIT!!! \(enemy.name) attacked \(player.name) for \(nowAttackPwr) HP"
                playerHPLbl.text = "\(player.hp) HP"
                
            }else{
                infoLbl.text = "\(enemy.name)'s attacked missed!"
                playerHPLbl.text = "\(player.hp) HP"
            }
        }
        
        
        if !player.isAlive {
            
            infoLbl.text = "\(enemy.name) killed \(player.name)"
            hideAll()
            whoWinsLbl.text = "\(enemy.name) Wins!!!"
            Restart(2)
        } else {
      
       timeDelay(Double(Int(arc4random_uniform(timeDelayTimeRnd))))
        }

    }
    
    @IBAction func playerAttackPressed(sender: AnyObject) {
        
        hideAttackButtons()
        generateAttackPwr()
        
        if enemy.attemptAttack(nowAttackPwr){
            if nowAttackPwr != 0 && nowAttackPwr != _attackPwr[3] {
                
            infoLbl.text = "\(player.name) attacked \(enemy.name) for \(nowAttackPwr) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
            }else if nowAttackPwr == _attackPwr[3] {
                
                infoLbl.text = "CRIT!!! \(player.name) attacked \(enemy.name) for \(nowAttackPwr) HP"
                enemyHPLbl.text = "\(enemy.hp) HP"
                
            }else{
                infoLbl.text = "\(player.name)'s attacked missed!"
            enemyHPLbl.text = "\(enemy.hp) HP"
            }
        }
        
     
        if !enemy.isAlive {
            
            infoLbl.text = "\(player.name) killed \(enemy.name)"
            hideAll()
            whoWinsLbl.text = "\(player.name) Wins!!!"
            Restart(2)
        } else {
        
       timeDelay(Double(Int(arc4random_uniform(timeDelayTimeRnd))))
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

