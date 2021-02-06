//
//  ConsoleIO.swift
//  Slice
//
//  Created by Alena Nesterkina on 2.02.21.
//

import Foundation

class ConsoleProvider {
    static func write(_ message: String, to output: AppEnvironment.OutputType = .standard) {
        switch output {
        case .standard: print(message)
        case .error: fputs(message, stderr)
        }
    }
}
