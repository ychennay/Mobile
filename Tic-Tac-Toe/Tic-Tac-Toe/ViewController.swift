//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Yu Chen on 11/18/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var activeGame = true
    
    @IBOutlet weak var startOverButton: UIButton!
    // Player 1 is nought, Player 2 is crosses
    var activePlayer = 1
    

    @IBAction func restartGame(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        activeGame = true
        activePlayer = 1
        
        outcomeLabel.alpha = 0
        startOverButton.isHidden = true
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
        
    }
    @IBOutlet weak var outcomeLabel: UILabel!
    
    // a 0 represents an unfilled slot in the game
    // a 1 represents noughts
    // a 2 represents crosses
 
    let winningCombinations = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if activePlayer == 1 {
            
            if gameState[activePosition] == 0 && activeGame {
                sender.setImage(UIImage(named: "nought.png"), for: [])
        gameState[activePosition] = activePlayer
                activePlayer = 2

            }
            
        } else {
            
            if gameState[activePosition] == 0 && activeGame {
                sender.setImage(UIImage(named:
                    "cross.png"), for: [])
            gameState[activePosition] = activePlayer
                activePlayer = 1
            }
            
        }
       
        for combination in winningCombinations{
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                print("A winner.")
                activeGame = false
                
                
                startOverButton.isHidden = false
                outcomeLabel.text = "Player " + String(activePlayer) + " has won."
                UIView.animate(withDuration: 1, animations: {
                    self.outcomeLabel.alpha = 1
                })
        }
            
     
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOverButton.isHidden = true
        outcomeLabel.alpha = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

