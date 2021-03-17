//
//  JobSheduler.swift
//  SuffixExtensionApp
//
//  Created by Влад Калаев on 17.03.2021.
//

import SwiftUI

class JobScheduler: ObservableObject {
    
    @Published var times: [String]

    @Published var jobQueues: [JobQueue]
    
    init(jobQueues: [JobQueue]) {
        self.jobQueues = jobQueues
        self.times = jobQueues.compactMap { $0.processTime }
    }
    
    func start() {
        self.jobQueues.enumerated().forEach { (index, jobQueue) in
            let queue = DispatchQueue(label: "Test", qos: .background, attributes: .concurrent)
            queue.async {
                jobQueue.start(index: index, completion: { self.times = self.jobQueues.compactMap { $0.processTime }})
            }
        }
    }
}
