//
//  JobQueue.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 17.03.2021.
//

import SwiftUI

class JobQueue {
    
    var processTime: String = "-"
    
    private var suffixSequenceArr = [SuffixSequence]()
    
    init(_ text: String) {
        self.suffixSequenceArr = Helper().setSuffixSequenceArray(text: text)
    }

    func start(index: Int, completion: @escaping () -> Void) {
        
        let startDate = Date()
        
        self.suffixSequenceArr.forEach { Helper().self.setSuffixArray(wordSequence: $0)}
       
        DispatchQueue.main.asyncAfter (deadline: .now() + (index == 0 ? 5 : 1)) {
            self.setProcessTime(startDate: startDate, stopDate: Date())
            completion()

        }
        
    }

    func dequeue() -> SuffixSequence? {
        guard !self.suffixSequenceArr.isEmpty else { return nil }
        return self.suffixSequenceArr.removeFirst()
    }
    
    
    func enqueue(_ text: String) {
        let newArr = Helper().setSuffixSequenceArray(text: text)
        self.suffixSequenceArr.append(contentsOf: newArr)
    }

    
    func setProcessTime(startDate: Date, stopDate: Date) {
        let time = stopDate.timeIntervalSince(startDate)
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        var times: [String] = []
        if hours > 0 {
            times.append("\(hours)h")
        }
        if minutes > 0 {
            times.append("\(minutes)m")
        }
        times.append("\(seconds)s")
        
        self.processTime = times.isEmpty ? "0s" : times.joined(separator: " ")
    }
}
