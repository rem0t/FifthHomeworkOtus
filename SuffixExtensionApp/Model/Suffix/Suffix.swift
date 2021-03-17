//
//  Suffix.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import Foundation

class Suffix {
    
    init(title: String, count: Int) {
        self.title = title
        self.count = count
    }
    
    var title: String
    var count: Int
}

extension Suffix: Identifiable {
    var id: String {
        UUID().uuidString
    }
}
