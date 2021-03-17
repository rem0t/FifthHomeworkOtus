//
//  StringProtocol.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import SwiftUI

extension StringProtocol {
    var words: [SubSequence] {
        split(whereSeparator: \.isLetter.negation)
    }
}

extension Bool {
    var negation: Bool { !self }
}
