//
//  Parser.swift
//  Slice
//
//  Created by Alena Nesterkina on 5.02.21.
//

import Foundation

protocol ParserProtocol {
    func parseToTask(input: String) throws -> Task
}

class Parser: ParserProtocol {
    
    private let validator: Validator
    
    init(validator: Validator) {
        self.validator = validator
    }
    
    func parseToTask(input: String) throws -> Task {
        let inputComponents = input.components(separatedBy: ["(", ")"])
            .filter { $0 != " " && !$0.isEmpty }
            .reduce(Array<String>()) { $0.appended($1.replacingOccurrences(of: " ", with: "")) }
        try validator.validateInputComponents(inputComponents)
        
        return try modelConversion(input: inputComponents)
    }
}

private extension Parser {
    func modelConversion(input: [String]) throws -> Task {
        guard let gridString = input.first else {
            throw AppEnvironment.CustomErrors.wrongConversion
        }
        
        let grid = try Grid(string: gridString)
        let points = try input.dropFirst().reduce(Array<Point>()) {
            try $0.appended(Point(string: $1))
        }
        
        return Task(grid: grid, points: points)
    }
}
