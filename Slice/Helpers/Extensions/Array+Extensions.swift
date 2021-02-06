//
//  Array+Extensions.swift
//  Slice
//
//  Created by Alena Nesterkina on 5.02.21.
//

import Foundation

extension Array {
    func appended(_ newElement: Element) -> Array<Element> {
        var buf = self
        buf.append(newElement)
        return buf
    }
}
