//
//  ViewController.swift
//  CardWar
//
//  Created by Marcin Pietrzak on 07.04.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerCard: UIImageView!
    @IBOutlet weak var playerScores: UILabel!
    var playerScore = 0
    
    @IBOutlet weak var cpuCard: UIImageView!
    @IBOutlet weak var cpuScores: UILabel!
    var cpuScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func dealButton(_ sender: UIButton) {
        let playerRandomNumber = arc4random_uniform(12) + 1
        let cpuRandomNumber = arc4random_uniform(12) + 1
        
        playerCard.image = UIImage(named: "card\(playerRandomNumber)")
        cpuCard.image = UIImage(named: "card\(cpuRandomNumber)")

        if playerRandomNumber > cpuRandomNumber {
            playerScore += 10
            playerScores.text = String(playerScore)
        } else if playerRandomNumber == cpuRandomNumber {
            playerScore += 5
            cpuScore += 5
            playerScores.text = String(playerScore)
            cpuScores.text = String(cpuScore)
        } else {
            cpuScore += 10
            cpuScores.text = String(cpuScore)
        }
        
            playerWin()
            cpuWin()
        
        }
    
    func cpuWinnerAlert() {
        let alertController = UIAlertController(title: "CPU Win!", message: "200 points earned", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel))
        
        show(alertController, sender: self)
        
    }
    
    func playerWinnerAlert() {
        let alertController = UIAlertController(title: "Player Win!", message: "200 points earned", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel))
        
        show(alertController, sender: self)
        
    }
    
    func playerWin() {
        if playerScore == 200 {
            playerWinnerAlert()
            
            playerScore = 0
            cpuScore = 0
            
            playerScores.text = String(playerScore)
            cpuScores.text = String(cpuScore)
        } else {
            
        }

    }
    
    func cpuWin() {
        if cpuScore == 200 {
            cpuWinnerAlert()
            
            playerScore = 0
            cpuScore = 0
            
            playerScores.text = String(playerScore)
            cpuScores.text = String(cpuScore)
        } else {
            
        }

    }

}

