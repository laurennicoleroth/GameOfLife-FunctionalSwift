//
//  ViewController.swift
//  GameOfLife
//
//  Created by Lauren Nicole Roth on 9/10/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  
  @IBOutlet weak var boardView: UIView!
  var life = Life()
  let gameBoard : GameBoard
  var timer : Timer!
  
  required init?(coder aDecoder: NSCoder) {
    gameBoard = GameBoard(createLife: life)
    
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    gameBoard.frame = boardView.frame
    gameBoard.center = CGPoint(x: gameBoard.frame.size.width / 2, y: gameBoard.frame.size.height / 2)
    boardView.addSubview(gameBoard)
    
    initializeGame()
    gameBoard.setNeedsDisplay()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func initializeGame() {
    for cell in life.cells {
      cell.state = State.randomState()
    }
  }
  
  func moment() {
    print("Calling moment")
    life.evolve()
    gameBoard.setNeedsDisplay()
  }
  
  @IBAction func startGameTouched(_ sender: Any) {
    timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.moment), userInfo: nil, repeats: true)
    print("timer", timer)
  }
  
  @IBAction func handleResetButtonTapped(_ sender: Any) {
    print(timer)
    if timer.isValid {
      timer.invalidate()
      initializeGame()
      gameBoard.setNeedsDisplay()
    } else {
      print("Something went wrong")
    }
    
    
  }
  
  
  
}

