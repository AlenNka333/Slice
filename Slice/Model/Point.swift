//
//  Point.swift
//  Slice
//
//  Created by Alena Nesterkina on 2.02.21.
//

import Foundation

struct Point: Equatable {
    let x: Int
    let y: Int
    var isVisited: Bool
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        isVisited = false
    }
    
    init(string: String) throws {
        let pointComponents = string.split(separator: ",")
        guard pointComponents.count == 2,
              let x = Int(pointComponents[0]),
              let y = Int(pointComponents[1]) else { throw AppEnvironment.CustomErrors.invalidInput }
        self.init(x: x, y: y)
    }
}
