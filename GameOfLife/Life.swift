//
//  Life.swift
//  GameOfLife
//
//  Created by Lauren Nicole Roth on 9/10/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import Foundation

class Life {
  var cells: [Cell]
  let gridSize: Int = 20
  
  init() {
    cells = [Cell]()
    cells = assignCellsToGrid()
  }
  
  lazy var assignCellsToGrid : () -> [Cell] = {
    [weak self] in
  
    var cells = [Cell]()
    for xLoc in 0..<self!.gridSize {
      for yLoc in 0..<self!.gridSize {
        cells.append(Cell(x: xLoc, y: yLoc))
      }
    }
    return cells
    
  }
  
  func evolve() {
    let liveCells = cells.filter {$0.state == .Living }
    let deadCells = cells.filter {$0.state != .Living }
    
    let dyingCells = liveCells.filter { !(2...3 ~= livingNeighbors(cell: $0)) }
    let newLife = deadCells.filter { livingNeighbors(cell: $0) == 3}
    
    for newCell in newLife {
      newCell.state = .Living
    }
    
    for deadCell in dyingCells {
      deadCell.state = .Dead
    }
  }
  
  func cellNeighbors(cell: Cell) -> [Cell] {
    return self.cells.getNeighbors { self.cellsAreNeighbors(sideA: cell, sideB: $0) }
  }
  
  func cellsAreNeighbors(sideA: Cell, sideB: Cell) -> Bool {
    
    let a = abs(sideA.xCoord - sideB.xCoord)
    let b = abs(sideA.yCoord - sideB.yCoord)
    
    if case (0...1, 0...1) = (a, b), !(a == 0 && b == 0) {
      return true
    } else {
      return false
    }
    
  }
  
  func livingNeighbors(cell: Cell) -> Int {
    return cellNeighbors(cell: cell).filter { $0.state == .Living}.count
  }
}
