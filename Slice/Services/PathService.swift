//
//  PathService.swift
//  Slice
//
//  Created by Alena Nesterkina on 4.02.21.
//

import Foundation

protocol PathServiceProtocol {
    func findSolution(unvisitedPlaces: [Point]) throws -> String
}

class PathService: PathServiceProtocol {
    func findSolution(unvisitedPlaces: [Point]) throws -> String {
        return try pathForming(unvisitedPlaces: unvisitedPlaces)
    }
}

private extension PathService {
    func pathForming(unvisitedPlaces: [Point], currentPoint: Point = Point(x: 0, y: 0)) throws -> String {
        var buffer = unvisitedPlaces
        buffer.sort { (distance(from: currentPoint, to: $0) < distance(from: currentPoint, to: $1)) }
        guard let nearestPoint = buffer.first else {
            throw AppEnvironment.CustomErrors.notExistingValue
        }
        let path = way(from: currentPoint, to: nearestPoint) + AppEnvironment.Instructions.drop.rawValue
        let nextPoint = buffer.removeFirst()
        guard !buffer.isEmpty else { return path }
        return try path +  pathForming(unvisitedPlaces: buffer, currentPoint: nextPoint)
    }
    
    func distance(from: Point, to: Point) -> Int {
        abs(from.x - to.x) + abs(from.y - to .y)
    }
    
    func way(from: Point, to: Point) -> String {
        let dx = to.x - from.x
        let dy = to.y - from.y
        
        let horizontalDirection: AppEnvironment.Instructions = dx < 0 ? .west : .east
        let verticalDirection: AppEnvironment.Instructions = dy < 0 ? .south : .north
        let horizontalDistance = abs(dx)
        let verticalDistance = abs(dy)
        
        let horizontalWay = (0..<horizontalDistance).reduce("") { result, _ in result + horizontalDirection.rawValue }
        let verticalWay = (0..<verticalDistance).reduce("") { result, _ in result + verticalDirection.rawValue }
        
        return horizontalWay + verticalWay
    }
}
