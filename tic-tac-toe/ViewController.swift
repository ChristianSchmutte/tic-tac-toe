//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Christian Schmutte on 21.02.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var playerTurnLabel: UILabel!
    var activePlayer = "X"
    var scoreX = 0
    var scoreO = 0
    
    // declare new game
    
    // Declare row, column dictionary
    
    var cellDict = ["1": "1", "2": "2", "3": "3", "4": "4", "5": "5", "6": "6", "7": "7", "8": "8", "9": "9"]
    
    // Win Logic
    
    func checkIfWon() -> Bool {
        // check for wincases
        if cellDict["1"] == cellDict["2"] && cellDict["1"] == cellDict["3"] {
            return true
        } else if cellDict["4"] == cellDict["5"] && cellDict["4"] == cellDict["6"] {
            return true
        } else if cellDict["7"] == cellDict["8"] && cellDict["4"] == cellDict["9"] {
            return true
        } else if cellDict["1"] == cellDict["4"] && cellDict["1"] == cellDict["7"] {
            return true
        } else if cellDict["2"] == cellDict["5"] && cellDict["2"] == cellDict["8"] {
            return true
        } else if cellDict["3"] == cellDict["6"] && cellDict["3"] == cellDict["9"] {
            return true
        } else if cellDict["1"] == cellDict["5"] && cellDict["1"] == cellDict["9"] {
            return true
        } else if cellDict["3"] == cellDict["5"] && cellDict["3"] == cellDict["7"] {
            return true
        }
        
        return false
        
    }
    
    // Get buttons action
    @IBAction func buttonTapped(_ sender: UIButton) {
        // wrap current button title into a variable
        let currentTitle = sender.title(for: .normal)!
        
        
        // determine which player is active
        if activePlayer == "X"{
            // Set cellDict with X
            cellDict[currentTitle] = activePlayer
            
            // Set button title to active player
            sender.setTitle(activePlayer, for: .normal)
            
            // Disable button
            sender.isEnabled = false
            // Check if won
            if checkIfWon(){
                // Change label to winning activePlayer
                playerTurnLabel.text = "Winner: \(activePlayer) "
                for button in gameButton {
                    if button.title(for: .normal) != "X" || button.title(for: .normal) != "O"{
                        button.isEnabled = false
                    }
                    
                }
                turnEveryButtonToWinner()
                updateScoreBoard(activePlayer)
                
            } else {
                // Change active player
                activePlayer = "O"
                // Change label to active player
                playerTurnLabel.text = "Player \(activePlayer) Turn"
            }
            
            
        } else if activePlayer == "O" {
            // Set cellDict with O
            cellDict[currentTitle] = activePlayer
            
            // Set button title to active player
            sender.setTitle(activePlayer, for: .normal)
            
            // Disable button
            sender.isEnabled = false
            
            // Check if won
            if checkIfWon(){
                // Change label to winning activePlayer
                playerTurnLabel.text = "Winner: \(activePlayer) "
                for button in gameButton {
                    if button.title(for: .normal) != "X" || button.title(for: .normal) != "O"{
                        button.isEnabled = false
                    }
                }
                turnEveryButtonToWinner()
                updateScoreBoard(activePlayer)
            } else {
                // Change active player
                activePlayer = "X"
                // Change label to active player
                playerTurnLabel.text = "Player \(activePlayer) Turn"
            }
            
        }

        
    }
    @IBAction func newGameButtonTapped(_ sender: UIButton) {
        startNewRound()
    }
    @IBOutlet var gameButton: [UIButton]!
    
    @IBOutlet weak var scoreBoardLabel: UILabel!
    func startNewRound(){
        var buttonCounter = 1
        
        for button in gameButton {
            button.setTitle(String(buttonCounter), for: .normal)
            button.isEnabled = true
            cellDict[String(buttonCounter)] = String(buttonCounter)
            buttonCounter += 1
            activePlayer = "X"
            playerTurnLabel.text = "Player \(activePlayer) Turn"
        }
        
        
        
    }
    
    func turnEveryButtonToWinner (){
        for button in gameButton {
            button.setTitle(activePlayer, for: .normal)
        }
    }
    
    func updateScoreBoard(_ winner: String) {
        if winner == "X"{
            scoreX += 1
            scoreBoardLabel.text = "Player X: \(scoreX)  Player O: \(scoreO)"
        } else if winner == "O" {
            scoreO += 1
            scoreBoardLabel.text = "Player X: \(scoreX)  Player O: \(scoreO)"
        }
        
        
    }
}

