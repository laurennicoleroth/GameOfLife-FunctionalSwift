//
//  Cell.swift
//  GameOfLife
//
//  Created by Lauren Nicole Roth on 9/10/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import Foundation

class Cell {
  let xCoord: Int
  let yCoord: Int
  var state: State
  
  init(x: Int, y: Int) {
    self.xCoord = x
    self.yCoord = y
    self.state = State.randomState()
  }
}
