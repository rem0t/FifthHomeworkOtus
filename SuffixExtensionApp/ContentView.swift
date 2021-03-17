//
//  ContentView.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 16.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ViewModel
    
    @State private var selection = 0
    var rubrics = ["All suffix", "Top 10 \"3 let\"", "Top 10 \"5 let\""]

    var body: some View {
        VStack {
            Picker("Options", selection:  self.$selection) {
                ForEach(0 ..< self.rubrics.count) { index in
                    Text(self.rubrics[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            if selection == 0 {
                AllSuffixView().environmentObject(ViewModel()) // обновление при перезаходе 
            } else if selection == 1 {
                Top3Suffix()
            } else if selection == 2 {
                Top5Suffix()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
