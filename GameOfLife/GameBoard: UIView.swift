//
//  GameBoard: UIView.swift
//  GameOfLife
//
//  Created by Lauren Nicole Roth on 9/10/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import UIKit

class GameBoard: UIView {
  
  
  let life: Life
  
  init(createLife: Life) {
    life = createLife
    super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    let currentContext = UIGraphicsGetCurrentContext()
    
    for cell in life.cells {
      currentContext!.setFillColor(colorForCell(state: cell.state).cgColor)
      currentContext!.addRect(frameForCell(cell: cell))
      currentContext?.fillPath()
    }
  }
  
  func colorForCell(state: State) -> UIColor {
    switch state {
    case .Living:
      return UIColor.green
    case .PreBirth:
      return UIColor.magenta
    case .Dead:
      return UIColor.black
    }
  }
  
  func frameForCell(cell: Cell) -> CGRect {
    let dimensions = CGFloat(self.life.gridSize)
    let cellSize = CGSize(width: self.bounds.width / dimensions, height: self.bounds.height / dimensions)
    return CGRect(x: (CGFloat(cell.xCoord) * cellSize.height), y: (CGFloat(cell.yCoord) * cellSize.height), width: cellSize.width, height: cellSize.height)
  }
}
