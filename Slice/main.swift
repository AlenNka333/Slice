//
//  main.swift
//  Slice
//
//  Created by Alena Nesterkina on 2.02.21.
//

import Foundation

class Main {
    private let pathService: PathServiceProtocol
    private let parser: ParserProtocol
    
    init(parser: ParserProtocol, pathService: PathServiceProtocol) {
        self.parser = parser
        self.pathService = pathService
    }
    
    func start() {
        let inputData = CommandLine.arguments[1]
        guard !inputData.isEmpty else { return }
        do {
            let parsedTask = try parser.parseToTask(input: inputData)
            let answer = try pathService.findSolution(unvisitedPlaces: parsedTask.points)
            ConsoleProvider.write(answer)
        } catch {
            ConsoleProvider.write(error.localizedDescription, to: .error)
        }
    }
}

let main = Main(parser: Parser(validator: Validator()), pathService: PathService())
main.start()
