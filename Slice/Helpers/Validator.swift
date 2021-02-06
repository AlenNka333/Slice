//
//  Validator.swift
//  Slice
//
//  Created by Alena Nesterkina on 2.02.21.
//

import Foundation

protocol ValidatorProtocol { }

class Validator: ValidatorProtocol {
    func validateInputComponents(_ input: [String]) throws {
        guard let grid = input.first else { throw AppEnvironment.CustomErrors.invalidInput }
        try validateGrid(grid)
        try input.dropFirst().forEach {
            try self.validatePoints($0)
        }
    }
}

private extension Validator {
    func validateGrid(_ input: String) throws {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "[0-9]+x[0-9]+")
        guard predicate.evaluate(with: input) else { throw AppEnvironment.CustomErrors.invalidInput }
    }
    
    func validatePoints(_ input: String) throws {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "[0-9]+,[0-9]+")
        guard predicate.evaluate(with: input) else { throw AppEnvironment.CustomErrors.invalidInput }
    }
}
