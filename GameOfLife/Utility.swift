//
//  Utility.swift
//  GameOfLife
//
//  Created by Lauren Nicole Roth on 9/10/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import Foundation

extension Array {
  func getNeighbors(predicate: (Element) -> Bool) -> [Element] {
    var neighbors = [Element]()
    for item in self {
      let Element = item
      if predicate(Element) {
        neighbors.append(Element)
      }
    }
    return neighbors
  }
}

extension Array {
  func customMap(transform: (Element) -> Element) -> [Element] {
    var result: [Element] = []
    for item in self {
      result.append(transform(item))
    }
    return result
  }
}
