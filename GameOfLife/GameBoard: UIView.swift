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
      return UIColor(red: 54/255, green: 127/255, blue: 255/255, alpha: 1.0)
    case .PreBirth:
      return UIColor(red: 0/255, green: 56/255, blue: 56/255, alpha: 1.0)
    case .Dead:
      return UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
    }
  }
  
  func frameForCell(cell: Cell) -> CGRect {
    let dimensions = CGFloat(self.life.gridSize)
    let cellSize = CGSize(width: self.bounds.width / dimensions, height: self.bounds.height / dimensions)
    return CGRect(x: (CGFloat(cell.xCoord) * cellSize.height), y: (CGFloat(cell.yCoord) * cellSize.height), width: cellSize.width, height: cellSize.height)
  }
}
