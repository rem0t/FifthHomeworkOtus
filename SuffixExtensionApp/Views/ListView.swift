//
//  ListView.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 17.03.2021.
//

import SwiftUI

struct SuffixList: View {
    
    var values: [Suffix]
    
    var body: some View {
        List {
            ForEach(self.values) { suffix in
                HStack {
                    Text(suffix.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("(\(suffix.count))")
                }
            }
        }
    }
}

struct SuffixList_Previews: PreviewProvider {
    static var previews: some View {
        SuffixList(values: [])
    }
}
