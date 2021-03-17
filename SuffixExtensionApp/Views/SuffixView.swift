//
//  SuffixView.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import SwiftUI

struct AllSuffixView: View {
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            SuffixList(values: self.model.suffixArray)
        }
    }
}

struct AllSuffixView_Previews: PreviewProvider {
    static var previews: some View {
        AllSuffixView()
    }
}
