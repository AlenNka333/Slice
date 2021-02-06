//
//  Grid.swift
//  Slice
//
//  Created by Alena Nesterkina on 2.02.21.
//

import Foundation

struct Grid: Equatable {
    let width: Int
    let height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    init(string: String) throws {
        let gridComponents = string.split(separator: "x")
        guard gridComponents.count == 2,
              let width = Int(gridComponents[0]),
              let height = Int(gridComponents[1]) else { throw AppEnvironment.CustomErrors.invalidInput }
        self.init(width: width, height: height)
    }
}

