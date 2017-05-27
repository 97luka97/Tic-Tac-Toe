//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Kostic on 4/30/17.
//  Copyright © 2017 Kostic. All rights reserved.
//

import UIKit

class PlayerVsPlayer: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        hideAllPictures()
        label1.text = "X player: \(counterForPlayer1)"
        label2.text = "O player: \(counterForPlayer2)"
    }
    @IBOutlet weak var combination036: UIImageView!
    @IBOutlet weak var combination147: UIImageView!
    @IBOutlet weak var combination258: UIImageView!
    @IBOutlet weak var combination012: UIImageView!
    @IBOutlet weak var combination345: UIImageView!
    @IBOutlet weak var combination678: UIImageView!
    @IBOutlet weak var combination048: UIImageView!
    @IBOutlet weak var combination246: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var counterForPlayer1 = 0
    var counterForPlayer2 = 0
    var activePlayer = 1 //X
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var setWithPressedButtons = Set<Int>()
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    var gameIsWon = false
    
    @IBAction func action(_ sender: UIButton) {
        setWithPressedButtons.insert(sender.tag)
        
        if (gameState[sender.tag - 1] == 0 && gameIsActive == true) {
            
            gameState[sender.tag - 1] = activePlayer
            
            if (activePlayer == 1) {
                
                sender.setImage(UIImage(named: "x.png"), for: UIControlState())
                activePlayer = 2
            } else {
                
                sender.setImage(UIImage(named: "o.png"), for: UIControlState())
                activePlayer = 1
            }
            
            
        }
        
        for combination in winningCombinations {
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                showLineWhenGameIsEnded(combination: combination)

                if gameState[combination[0]] == 1 {
                    
                    showAlertForX()
                    setWithPressedButtons.insert(sender.tag)
                    counterForPlayer1 += 1
                    label1.text = "X player: \(counterForPlayer1)"
                } else {
                    
                    showAlertForO()
                    setWithPressedButtons.insert(sender.tag)
                    counterForPlayer2 += 1
                    label2.text = "O player: \(counterForPlayer2)"
                }
            }
        }
        if setWithPressedButtons.count == 9 {
            showAlertForDraw()
        }

    }
    
    func hideAllPictures() {
        combination012.isHidden = true
        combination345.isHidden = true
        combination678.isHidden = true
        combination036.isHidden = true
        combination147.isHidden = true
        combination258.isHidden = true
        combination048.isHidden = true
        combination246.isHidden = true
    }
    
    @IBAction func mainMenu(_ sender: Any) {
        
        counterForPlayer1 = 0
        counterForPlayer2 = 0
        label1.text = "X player: \(counterForPlayer1)"
        label2.text = "O player: \(counterForPlayer2)"
    }
    
    func showLineWhenGameIsEnded(combination: [Int]) {
        if combination == [0, 1, 2] {
            combination012.isHidden = false
        } else if combination == [3, 4, 5] {
            combination345.isHidden = false
        } else if combination == [6, 7, 8] {
            combination678.isHidden = false
        } else if combination == [0, 3, 6] {
            combination036.isHidden = false
        } else if combination == [1, 4, 7] {
            combination147.isHidden = false
        } else if combination == [2, 5, 8] {
            combination258.isHidden = false
        } else if combination == [0, 4, 8] {
            combination048.isHidden = false
        } else {
            combination246.isHidden = false
        }
    }
    
    func showAlertForX() {
        let refreshAlert = UIAlertController(title: "CROSS HAS WON!!!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { (action: UIAlertAction!) in
            self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            self.gameIsActive = true
            self.activePlayer = 1
            self.setWithPressedButtons = []
            self.hideAllPictures()
            
            for i in 1...9 {
                let button = self.view.viewWithTag(i) as! UIButton
                button.setImage(nil, for: UIControlState())
                
            }
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func showAlertForO() {
        let refreshAlert = UIAlertController(title: "NOUGHT HAS WON!!!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { (action: UIAlertAction!) in
            self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            self.gameIsActive = true
            self.activePlayer = 1
            self.setWithPressedButtons = []
            self.hideAllPictures()
            
            for i in 1...9 {
                let button = self.view.viewWithTag(i) as! UIButton
                button.setImage(nil, for: UIControlState())
                
            }
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func showAlertForDraw() {
        let refreshAlert = UIAlertController(title: "It was a draw!!!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { (action: UIAlertAction!) in
            self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            self.gameIsActive = true
            self.activePlayer = 1
            self.setWithPressedButtons = []
            self.hideAllPictures()
            
            for i in 1...9 {
                let button = self.view.viewWithTag(i) as! UIButton
                button.setImage(nil, for: UIControlState())
                
            }
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
}

