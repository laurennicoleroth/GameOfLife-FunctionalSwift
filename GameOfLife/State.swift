//
//  State.swift
//  GameOfLife
//
//  Created by Lauren Nicole Roth on 9/10/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import Foundation

enum State : Int {

  case Living = 0, PreBirth, Dead
  
  static func randomState() -> State {
    guard let state = State(rawValue: Int(arc4random_uniform(2))) else {
        return .PreBirth
    }
    return state
  }
}
