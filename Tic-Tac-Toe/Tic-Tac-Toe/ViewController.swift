//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Yu Chen on 11/18/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Player 1 is nought, Player 2 is crosses
    var activePlayer = 1
    
    // a 0 represents an unfilled slot in the game
    // a 1 represents noughts
    // a 2 represents crosses
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8]]
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if activePlayer == 1 {
            
            if gameState[activePosition] == 0 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
        gameState[activePosition] = activePlayer
                activePlayer = 2

            }
            
        } else {
            
            if gameState[activePosition] == 0 {
                sender.setImage(UIImage(named:
                    "cross.png"), for: [])
            gameState[activePosition] = activePlayer
                activePlayer = 1
            }
            
        }
        
        print(sender.tag)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

