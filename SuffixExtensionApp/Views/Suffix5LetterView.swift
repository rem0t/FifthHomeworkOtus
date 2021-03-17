//
//  Suffix5LetterView.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import SwiftUI

struct Top5Suffix: View {
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            SuffixList(values: model.top5SuffixArray)
        }
    }
}

struct Top5Suffix_Previews: PreviewProvider {
    static var previews: some View {
        Top5Suffix()
    }
}
