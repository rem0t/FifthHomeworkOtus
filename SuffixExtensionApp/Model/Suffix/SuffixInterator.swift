//
//  SuffixInterator.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import Foundation

struct SuffixInteractor: IteratorProtocol {
   
    let string: String
    var offset: String.Index
    init(string: String) {
        self.string = string
        self.offset = string.endIndex
    }
    
    mutating func next() -> Substring? {
        guard self.offset > self.string.startIndex else { return nil }
        self.offset = string.index(before: self.offset)
        return string.suffix(from: self.offset)
        
    }
}
