//
//  ViewModel.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var suffixArray = [Suffix]()
    @Published var top3SuffixArray = [Suffix]()
    @Published var top5SuffixArray = [Suffix]()
    
    @Published var texts = [String]()
    @Published var jobScheduler: JobScheduler

    let longText = "group.suffixApp"
    
    init() {
        
        let defaults = UserDefaults(suiteName: "group.suffixApp")
        defaults?.synchronize()
        
        let texts = defaults?.array(forKey: "textArr") as? [String] ?? [
            "Lorem ipsum dolor sit amet",
            "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?",
            "Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain"
        ]
        let jobQueue = texts.compactMap { JobQueue($0) }

        self.texts = texts
        self.jobScheduler = JobScheduler(jobQueues: jobQueue)

        let textString = defaults?.string(forKey: "text") ?? "The advice of prepending your team ID will silence the warning, but will also create a new empty user defaults. This will result in any previously stored data being unreadable."
        
        let wordsSuffixArray = Helper().setSuffixSequenceArray(text: textString)
        wordsSuffixArray.forEach { [weak self] wordSequence in
            guard let strongify = self else { return }
            strongify.suffixArray = Helper().setSuffixArray(wordSequence: wordSequence, previousArr: strongify.suffixArray)
        }
        
        self.suffixArray = self.suffixArray.sorted(by: { $0.title < $1.title })
        self.top3SuffixArray = Array(self.suffixArray.filter { $0.title.count == 3 }.sorted(by: { $0.count > $01.count }).prefix(10))
        self.top5SuffixArray = Array(self.suffixArray.filter { $0.title.count == 5 }.sorted(by: { $0.count > $01.count }).prefix(10))
    }

}


