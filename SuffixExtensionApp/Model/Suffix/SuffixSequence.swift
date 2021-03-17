//
//  SuffixSequence.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import SwiftUI

struct SuffixSequence: Sequence {
    
    let string: String
    
    func makeIterator() -> SuffixInteractor {
        return SuffixInteractor(string: self.string)
    }
    
}

extension SuffixSequence: Equatable {}
