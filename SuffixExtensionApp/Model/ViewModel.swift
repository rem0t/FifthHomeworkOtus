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
    
    let longText = "group.suffixApp"
    
    init() {
        let defaults = UserDefaults(suiteName: "group.suffixApp")
        defaults?.synchronize()
        
        let texts = defaults?.array(forKey: "textArr") as? [String] ?? ["Lorem ipsum dolor sit amet"]
        self.texts = texts
        
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
    
    func sortSuffixArray(isAsc: Bool) {
        self.suffixArray = self.suffixArray.sorted(by: { isAsc ? $0.title < $1.title : $0.title > $1.title })
    }
}


