//
//  AppEnvironment.swift
//  Slice
//
//  Created by Alena Nesterkina on 2.02.21.
//

import Foundation

enum AppEnvironment {
    enum OutputType {
        case error
        case standard
    }
    
    enum CustomErrors: Error {
        case invalidInput
        case wrongConversion
        case notExistingValue
    }
    
    enum Instructions: String {
        case north = "N"
        case south = "S"
        case east = "E"
        case west = "W"
        case drop = "D"
    }
}

// MARK: - Errors description
extension AppEnvironment.CustomErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "Please, check your input. For help use example: 5x5 (1, 3) (4, 4)."
        case .wrongConversion:
            return "We can't convert your input. Please, check correctness using example: 5x5 (1, 3) (4, 4)."
        case .notExistingValue:
            return "Something went wrong during solution calculating. Please, repeat your request."
        }
    }
}
