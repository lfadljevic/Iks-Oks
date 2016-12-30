//
//  ViewController.swift
//  Iks-Oks
//
//  Created by Leon Fadljevic on 29.12.2016..
//  Copyright © 2016. Leon Fadljevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b21: UIButton!
    @IBOutlet weak var b22: UIButton!
    @IBOutlet weak var b23: UIButton!
    @IBOutlet weak var b31: UIButton!
    @IBOutlet weak var b32: UIButton!
    @IBOutlet weak var b33: UIButton!
    @IBOutlet weak var b1: UIButton!
    var onMove: String!
    var rand: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Randomly pick a player that starts first
        randomPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func titleButtonTap(_ sender: UIButton) {
        sender.setTitle(onMove!, for: .normal)
        sender.isUserInteractionEnabled = false
        
        // Check if we have a winner
        if ((b11.title(for: .normal)! == "X" && b12.title(for: .normal)! == "X" && b13.title(for: .normal)! == "X") ||
            (b21.title(for: .normal)! == "X" && b22.title(for: .normal)! == "X" && b23.title(for: .normal)! == "X") ||
            (b31.title(for: .normal)! == "X" && b32.title(for: .normal)! == "X" && b33.title(for: .normal)! == "X") ||
            (b11.title(for: .normal)! == "X" && b21.title(for: .normal)! == "X" && b31.title(for: .normal)! == "X") ||
            (b12.title(for: .normal)! == "X" && b22.title(for: .normal)! == "X" && b32.title(for: .normal)! == "X") ||
            (b13.title(for: .normal)! == "X" && b23.title(for: .normal)! == "X" && b33.title(for: .normal)! == "X") ||
            (b11.title(for: .normal)! == "X" && b22.title(for: .normal)! == "X" && b33.title(for: .normal)! == "X") ||
            (b13.title(for: .normal)! == "X" && b22.title(for: .normal)! == "X" && b31.title(for: .normal)! == "X")) {
            
            // Player X won
            stateLabel.text = "Game state: Player X won!"
            disableAllButtons()
            b1.setTitle("New Game", for: .normal)
            
        }else if (
            (b11.title(for: .normal)! == "O" && b12.title(for: .normal)! == "O" && b13.title(for: .normal)! == "O") ||
            (b21.title(for: .normal)! == "O" && b22.title(for: .normal)! == "O" && b23.title(for: .normal)! == "O") ||
            (b31.title(for: .normal)! == "O" && b32.title(for: .normal)! == "O" && b33.title(for: .normal)! == "O") ||
            (b11.title(for: .normal)! == "O" && b21.title(for: .normal)! == "O" && b31.title(for: .normal)! == "O") ||
            (b12.title(for: .normal)! == "O" && b22.title(for: .normal)! == "O" && b32.title(for: .normal)! == "O") ||
            (b13.title(for: .normal)! == "O" && b23.title(for: .normal)! == "O" && b33.title(for: .normal)! == "O") ||
            (b11.title(for: .normal)! == "O" && b22.title(for: .normal)! == "O" && b33.title(for: .normal)! == "O") ||
            (b13.title(for: .normal)! == "O" && b22.title(for: .normal)! == "O" && b31.title(for: .normal)! == "O")) {
            
            // Player O won
            stateLabel.text = "Game state: Player O won!"
            disableAllButtons()
            b1.setTitle("New Game", for: .normal)
            
        }else {
            // Check if it is a draw
            if (b11.isUserInteractionEnabled == false && b12.isUserInteractionEnabled == false &&
                b13.isUserInteractionEnabled == false && b21.isUserInteractionEnabled == false &&
                b22.isUserInteractionEnabled == false && b23.isUserInteractionEnabled == false &&
                b31.isUserInteractionEnabled == false && b32.isUserInteractionEnabled == false &&
                b33.isUserInteractionEnabled == false) {
                
                // Game tie
                stateLabel.text = "Game state: Draw!"
                b1.setTitle("New Game", for: .normal)
            }else {
                // Change player on move
                changePlayer()
            }
        }
    }
    
    @IBAction func resetOrNewTap(_ sender: UIButton) {
        b11.setTitle("Button", for: .normal)
        b12.setTitle("Button", for: .normal)
        b13.setTitle("Button", for: .normal)
        b21.setTitle("Button", for: .normal)
        b22.setTitle("Button", for: .normal)
        b23.setTitle("Button", for: .normal)
        b31.setTitle("Button", for: .normal)
        b32.setTitle("Button", for: .normal)
        b33.setTitle("Button", for: .normal)
        
        b11.isUserInteractionEnabled = true
        b12.isUserInteractionEnabled = true
        b13.isUserInteractionEnabled = true
        b21.isUserInteractionEnabled = true
        b22.isUserInteractionEnabled = true
        b23.isUserInteractionEnabled = true
        b31.isUserInteractionEnabled = true
        b32.isUserInteractionEnabled = true
        b33.isUserInteractionEnabled = true
        
        b1.setTitle("Reset", for: .normal)
        
        // Randomly pick a player that strats first
        randomPlayer()
    }
    
    func randomPlayer() {
        rand = Int(arc4random_uniform(2))
        if(rand == 1){
            stateLabel.text = "Game state: Player X on the move"
            onMove = "X"
        }else{
            stateLabel.text = "Game state: Player O on the move"
            onMove = "O"
        }
    }
    
    func changePlayer() {
        if(onMove == "X"){
            onMove = "O"
            stateLabel.text = "Game state: Player O on the move"
        }else{
            onMove = "X"
            stateLabel.text = "Game state: Player X on the move"
        }
    }
    
    func disableAllButtons() {
        b11.isUserInteractionEnabled = false
        b12.isUserInteractionEnabled = false
        b13.isUserInteractionEnabled = false
        b21.isUserInteractionEnabled = false
        b22.isUserInteractionEnabled = false
        b23.isUserInteractionEnabled = false
        b31.isUserInteractionEnabled = false
        b32.isUserInteractionEnabled = false
        b33.isUserInteractionEnabled = false
    }

}

