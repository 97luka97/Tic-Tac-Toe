//
//  PlayerVsAI.swift
//  Tic Tac Toe
//
//  Created by Kostic on 4/30/17.
//  Copyright © 2017 Kostic. All rights reserved.
//

import UIKit


class PlayerVsAI: UIViewController {
    
    var gameOver: Bool = false
    var plays: [Int : Int] = [:]
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        hideAllPictures()
        playerLabel.text = "Player: \(String(playerCounter))"
        computerLabel.text = "Computer: \(String(computerCounter))"
    }
    
    @IBOutlet weak var combination036: UIImageView!
    @IBOutlet weak var combination258: UIImageView!
    @IBOutlet weak var combination147: UIImageView!
    @IBOutlet weak var combination012: UIImageView!
    @IBOutlet weak var combination345: UIImageView!
    @IBOutlet weak var combination678: UIImageView!
    @IBOutlet weak var combination048: UIImageView!
    @IBOutlet weak var combination246: UIImageView!

    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var computerLabel: UILabel!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    var playerCounter: Int = 0
    var computerCounter: Int = 0
    var aiDoesTurnTimer = Timer()
    
    @IBAction func btnClicked(_ sender: UIButton) {
        if !gameOver {
            var gridToPlace = 0
            if sender == button0 {
                gridToPlace = 0
                
            }
            if sender == button1 {
                gridToPlace = 1
                
            }
            if sender == button2 {
                gridToPlace = 2
                
            }
            if sender == button3 {
                gridToPlace = 3
                
            }
            if sender == button4 {
                gridToPlace = 4
            }
            if sender == button5 {
                gridToPlace = 5
            }
            if sender == button6 {
                gridToPlace = 6
            }
            if sender == button7 {
                gridToPlace = 7
            }
            if sender == button8 {
                gridToPlace = 8
            }
            
            plays[gridToPlace] = plays[gridToPlace] != 0 ? 1 : 0
            
            if plays[gridToPlace] == 1 {
                resetView()
                checkForWin()
                aiDoesTurnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(AIDoesTurn), userInfo: nil, repeats: false)
                resetView()
            }
        }
    }
    
    func checkForWin() {
        
        if (plays[0] == 1 && plays[1] == 1 && plays[2] == 1) ||
            (plays[3] == 1 && plays[4] == 1 && plays[5] == 1) ||
            (plays[6] == 1 && plays[7] == 1 && plays[8] == 1) ||
            (plays[0] == 1 && plays[3] == 1 && plays[6] == 1) ||
            (plays[1] == 1 && plays[4] == 1 && plays[7] == 1) ||
            (plays[2] == 1 && plays[5] == 1 && plays[8] == 1) ||
            (plays[0] == 1 && plays[4] == 1 && plays[8] == 1) ||
            (plays[2] == 1 && plays[4] == 1 && plays[6] == 1) &&
            !gameOver {
            
            if plays[0] == 1 && plays[1] == 1 && plays[2] == 1 {
                combination012.isHidden = false
            } else if plays[3] == 1 && plays[4] == 1 && plays[5] == 1 {
                combination345.isHidden = false
            } else if plays[6] == 1 && plays[7] == 1 && plays[8] == 1 {
                combination678.isHidden = false
            } else if plays[0] == 1 && plays[3] == 1 && plays[6] == 1 {
                combination036.isHidden = false
            } else if plays[1] == 1 && plays[4] == 1 && plays[7] == 1 {
                combination147.isHidden = false
            } else if plays[2] == 1 && plays[5] == 1 && plays[8] == 1 {
                combination258.isHidden = false
            } else if plays[0] == 1 && plays[4] == 1 && plays[8] == 1 {
                combination048.isHidden = false
            } else if plays[2] == 1 && plays[4] == 1 && plays[6] == 1 {
                combination246.isHidden = false
            }
            gameOver = true
            playerCounter = playerCounter + 1
            playerLabel.text = "Player: \(String(Int(Double(playerCounter / 2))))"
            showAlertForX()

            return
        }
        
        if (plays[0] == 0 && plays[1] == 0 && plays[2] == 0) ||
            (plays[3] == 0 && plays[4] == 0 && plays[5] == 0) ||
            (plays[6] == 0 && plays[7] == 0 && plays[8] == 0) ||
            (plays[0] == 0 && plays[3] == 0 && plays[6] == 0) ||
            (plays[1] == 0 && plays[4] == 0 && plays[7] == 0) ||
            (plays[2] == 0 && plays[5] == 0 && plays[8] == 0) ||
            (plays[0] == 0 && plays[4] == 0 && plays[8] == 0) ||
            (plays[2] == 0 && plays[4] == 0 && plays[6] == 0) &&
            !gameOver {
        
            showLineWhenGameIsEnded(plays: plays)
            gameOver = true
            computerCounter += 1
            computerLabel.text = "Computer: \(String(computerCounter))"
            showAlertForO()

            return
        }
        
        if !plays.values.contains(-1) {
            gameOver = true
            showAlertForDraw()
        }
    }
    
    
    func resetView() {
        if !gameOver {
            button0.setTitle(plays[0] == 0 ? "O": (plays[0] == 1 ? "X" : button0.titleLabel?.text), for: UIControlState.normal)
            button1.setTitle(plays[1] == 0 ? "O": (plays[1] == 1 ? "X" : button1.titleLabel?.text), for: UIControlState.normal)
            button2.setTitle(plays[2] == 0 ? "O": (plays[2] == 1 ? "X" : button2.titleLabel?.text), for: UIControlState.normal)
            button3.setTitle(plays[3] == 0 ? "O": (plays[3] == 1 ? "X" : button3.titleLabel?.text), for: UIControlState.normal)
            button4.setTitle(plays[4] == 0 ? "O": (plays[4] == 1 ? "X" : button4.titleLabel?.text), for: UIControlState.normal)
            button5.setTitle(plays[5] == 0 ? "O": (plays[5] == 1 ? "X" : button5.titleLabel?.text), for: UIControlState.normal)
            button6.setTitle(plays[6] == 0 ? "O": (plays[6] == 1 ? "X" : button6.titleLabel?.text), for: UIControlState.normal)
            button7.setTitle(plays[7] == 0 ? "O": (plays[7] == 1 ? "X" : button7.titleLabel?.text), for: UIControlState.normal)
            button8.setTitle(plays[8] == 0 ? "O": (plays[8] == 1 ? "X" : button8.titleLabel?.text), for: UIControlState.normal)
            changeTitleWithImage()
        }
    }
    
    func reset() {
        
        for i in 0...8 {
            plays[i] = -1
        }
        
        button0.setTitle(nil, for: UIControlState.normal)
        button1.setTitle(nil, for: UIControlState.normal)
        button2.setTitle(nil, for: UIControlState.normal)
        button3.setTitle(nil, for: UIControlState.normal)
        button4.setTitle(nil, for: UIControlState.normal)
        button5.setTitle(nil, for: UIControlState.normal)
        button6.setTitle(nil, for: UIControlState.normal)
        button7.setTitle(nil, for: UIControlState.normal)
        button8.setTitle(nil, for: UIControlState.normal)
        gameOver = false
        
    }
    
    func AIDoesTurn() {
        var currentMove: Int!
        
        if plays[1] == -1 {
            currentMove = 1
        }
        if plays[3] == -1 {
            currentMove = 3
        }
        if plays[5] == -1 {
            currentMove = 5
        }
        if plays[7] == -1 {
            currentMove = 7
        }
        
        if plays[0] == -1 {
            currentMove = 0
        }
        if plays[2] == -1 {
            currentMove = 2
        }
        if plays[6] == -1 {
            currentMove = 6
        }
        if plays[8] == -1 {
            currentMove = 8
        }
        
        if plays[4] == -1 {
            currentMove = 4
        }
        
        if plays[1] == 1 && plays[3] == 1 && plays[0] == -1 {
            currentMove = 0
        }
        
        if plays[1] == 1 && plays[7] == 1 && plays[6] == -1 {
            currentMove = 6
        }
        if plays[7] == 1 && plays[5] == 1 && plays[8] == -1 {
            currentMove = 8
        }
        if plays[5] == 1 && plays[1] == 1 && plays[2] == -1 {
            currentMove = 2
        }
        
        if let winAvailable = twoInRow(player: "x", inArray: plays) {
            currentMove = winAvailable
        }
        
        if let winAvailable = twoInRow(player: "o", inArray: plays) {
            currentMove = winAvailable
        }
        
        if let _ = currentMove {
            plays[currentMove!] = 0
            resetView()
            checkForWin()
            resetView()
        }
        
    }
    
    func twoInRow(player: String, inArray: [Int: Int]) -> Int? {
        
        if player == "x" {
            
            if inArray[0] == 1 && inArray[1] == 1 && inArray[2] == -1 {
                return 2
            }
            if inArray[0] == 1 && inArray[1] == -1 && inArray[2] == 1 {
                return 1
            }
            
            if inArray[0] == -1 && inArray[1] == 1 && inArray[2] == 1 {
                return 0
            }
            
            
            if inArray[3] == 1 && inArray[4] == 1 && inArray[5] == -1 {
                return 5
            }
            if inArray[3] == 1 && inArray[4] == -1 && inArray[5] == 1 {
                return 4
            }
            
            if inArray[3] == -1 && inArray[4] == 1 && inArray[5] == 1 {
                return 3
            }
            
            
            if inArray[6] == 1 && inArray[7] == 1 && inArray[8] == -1 {
                return 8
            }
            if inArray[6] == 1 && inArray[7] == -1 && inArray[8] == 1 {
                return 7
            }
            
            if inArray[6] == -1 && inArray[7] == 1 && inArray[8] == 1 {
                return 6
            }
            
            
            if inArray[0] == 1 && inArray[3] == 1 && inArray[6] == -1 {
                return 6
            }
            if inArray[0] == 1 && inArray[3] == -1 && inArray[6] == 1 {
                return 3
            }
            
            if inArray[0] == -1 && inArray[3] == 1 && inArray[6] == 1 {
                return 0
            }
            
            
            if inArray[1] == 1 && inArray[4] == 1 && inArray[7] == -1 {
                return 7
            }
            if inArray[1] == 1 && inArray[4] == -1 && inArray[7] == 1 {
                return 4
            }
            
            if inArray[1] == -1 && inArray[4] == 1 && inArray[7] == 1 {
                return 1
            }
            
            
            if inArray[2] == 1 && inArray[5] == 1 && inArray[8] == -1 {
                return 8
            }
            if inArray[2] == 1 && inArray[5] == -1 && inArray[8] == 1 {
                return 5
            }
            
            if inArray[2] == -1 && inArray[5] == 1 && inArray[8] == 1 {
                return 2
            }
            
        }
        return nil
    }
    
    func changeTitleWithImage() {
        if button0.currentTitle == "X" {
            button0.setTitle("", for: UIControlState.normal)
            button0.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button0.currentTitle == "O" {
            button0.setTitle("", for: UIControlState.normal)
            button0.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button1.currentTitle == "X" {
            button1.setTitle("", for: UIControlState.normal)
            button1.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button1.currentTitle == "O" {
            button1.setTitle("", for: UIControlState.normal)
            button1.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button2.currentTitle == "X" {
            button2.setTitle("", for: UIControlState.normal)
            button2.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button2.currentTitle == "O" {
            button2.setTitle("", for: UIControlState.normal)
            button2.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button3.currentTitle == "X" {
            button3.setTitle("", for: UIControlState.normal)
            button3.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button3.currentTitle == "O" {
            button3.setTitle("", for: UIControlState.normal)
            button3.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button4.currentTitle == "X" {
            button4.setTitle("", for: UIControlState.normal)
            button4.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button4.currentTitle == "O" {
            button4.setTitle("", for: UIControlState.normal)
            button4.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button5.currentTitle == "X" {
            button5.setTitle("", for: UIControlState.normal)
            button5.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button5.currentTitle == "O" {
            button5.setTitle("", for: UIControlState.normal)
            button5.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button6.currentTitle == "X" {
            button6.setTitle("", for: UIControlState.normal)
            button6.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button6.currentTitle == "O" {
            button6.setTitle("", for: UIControlState.normal)
            button6.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button7.currentTitle == "X" {
            button7.setTitle("", for: UIControlState.normal)
            button7.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button7.currentTitle == "O" {
            button7.setTitle("", for: UIControlState.normal)
            button7.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
        if button8.currentTitle == "X" {
            button8.setTitle("", for: UIControlState.normal)
            button8.setImage(UIImage(named: "x.png"), for: UIControlState.normal)
        } else if button8.currentTitle == "O" {
            button8.setTitle("", for: UIControlState.normal)
            button8.setImage(UIImage(named: "o.png"), for: UIControlState.normal)
        }
    }
    
    func showLineWhenGameIsEnded(plays: [Int: Int]) {
        if plays[0] == 0 && plays[1] == 0 && plays[2] == 0 {
            combination012.isHidden = false
        } else if plays[3] == 0 && plays[4] == 0 && plays[5] == 0 {
            combination345.isHidden = false
        } else if plays[6] == 0 && plays[7] == 0 && plays[8] == 0 {
            combination678.isHidden = false
        } else if plays[0] == 0 && plays[3] == 0 && plays[6] == 0 {
            combination036.isHidden = false
        } else if plays[1] == 0 && plays[4] == 0 && plays[7] == 0 {
            combination147.isHidden = false
        } else if plays[2] == 0 && plays[5] == 0 && plays[8] == 0 {
            combination258.isHidden = false
        } else if plays[0] == 0 && plays[4] == 0 && plays[8] == 0 {
            combination048.isHidden = false
        } else if plays[2] == 0 && plays[4] == 0 && plays[6] == 0 {
            combination246.isHidden = false
        }
    }
    
    func hideAllPictures() {
        combination036.isHidden = true
        combination258.isHidden = true
        combination147.isHidden = true
        combination012.isHidden = true
        combination345.isHidden = true
        combination678.isHidden = true
        combination048.isHidden = true
        combination246.isHidden = true
    }
    
    @IBAction func mainMenu(_ sender: Any) {
        playerCounter = 0
        computerCounter = 0
        playerLabel.text = "Player: \(String(playerCounter))"
        computerLabel.text = "Computer: \(String(computerCounter))"
    }
    
    func showAlertForX() {
        let refreshAlert = UIAlertController(title: "CROSS HAS WON!!!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { (action: UIAlertAction!) in
            self.gameOver = false
            self.hideAllPictures()
            self.reset()
            
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
            self.gameOver = false
            self.hideAllPictures()
            self.reset()
            
            for i in 1...9 {
                let button = self.view.viewWithTag(i) as! UIButton
                button.setImage(nil, for: UIControlState())
                
            }
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func showAlertForDraw() {
        let refreshAlert = UIAlertController(title: "IT WAS A DRAW!!!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { (action: UIAlertAction!) in
            self.gameOver = false
            self.hideAllPictures()
            self.reset()
            
            for i in 1...9 {
                let button = self.view.viewWithTag(i) as! UIButton
                button.setImage(nil, for: UIControlState())
                
            }
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
}
