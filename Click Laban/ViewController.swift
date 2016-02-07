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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Redford(startingHp: 100, attackPwr: 20)
        enemy = Babalu(startingHp: 100, attackPwr: 20)
        
        playerHPLbl.text = "\(player.hp) HP"
        enemyHPLbl.text = "\(enemy.hp) HP"
        whoWinsLbl.text = ""
        showAttackButtons()
        playerImg.hidden = false
        enemyImg.hidden = false
        

        
        
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
        NSTimer.scheduledTimerWithTimeInterval(sec, target: self, selector: "showAttackButtons", userInfo: nil, repeats: false)
        
    }
    
    func Restart (sec: Double) {
        NSTimer.scheduledTimerWithTimeInterval(sec, target: self, selector: "viewDidLoad", userInfo: nil, repeats: false)
        
    }
    
    @IBAction func enemyAttackPressed(sender: AnyObject) {
        
        hideAttackButtons()
        
        if player.attemptAttack(enemy.attackPwr){
            infoLbl.text = "\(enemy.name) attacked \(player.name) for \(enemy.attackPwr) HP"
            playerHPLbl.text = "\(player.hp) HP"
        }
        
        
        if !player.isAlive {
            
            infoLbl.text = "\(enemy.name) killed \(player.name)"
            hideAll()
            whoWinsLbl.text = "\(enemy.name) Wins!!!"
            Restart(2)
        } else {
      
       timeDelay(Double(Int(arc4random_uniform(5))))
        }

    }
    
    @IBAction func playerAttackPressed(sender: AnyObject) {
        
        hideAttackButtons()
        
        if enemy.attemptAttack(player.attackPwr){
            infoLbl.text = "\(player.name) attacked \(enemy.name) for \(player.attackPwr) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
        }
        
     
        if !enemy.isAlive {
            
            infoLbl.text = "\(player.name) killed \(enemy.name)"
            hideAll()
            whoWinsLbl.text = "\(player.name) Wins!!!"
            Restart(2)
        } else {
        
       timeDelay(Double(Int(arc4random_uniform(5))))
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

