//
//  Helper.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import Foundation

struct Helper {
    
    func setSuffixSequenceArray(text: String) -> [SuffixSequence] {
        text.words.map { SuffixSequence(string: String($0)) }
    }
    
    @discardableResult
    func setSuffixArray(wordSequence: SuffixSequence, previousArr: [Suffix] = []) -> [Suffix] {
        var resultArr = previousArr
        wordSequence.forEach { subString in
            let suffix = String(subString).lowercased()
            guard let currentElement = resultArr.first(where: { $0.title == suffix }) else {
                resultArr.append(Suffix(title: suffix, count: 1))
                return
            }
            currentElement.count += 1
        }
        return resultArr
    }
}
