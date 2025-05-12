//
//  Numeric.swift
//  Math-Game
//
//  Created by Ronjie Diafante Man-on on 5/12/25.
//

import Foundation

let ordinalFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter
}()

extension Numeric {
    var ordinal: String {
        return ordinalFormatter.string(for: self) ?? String(describing: self)
    }
}
