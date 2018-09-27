//
//  ConsoleIO.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/26/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

class ConsoleIO {
    static func printResults(_ inputNodes: [Dictionary<String, Any>]) {
        for item in inputNodes {
            if let output = JSONDatabase.itemAsJSON(item) {
                print(output)
            }
        }
        print("Found \(inputNodes.count) \(inputNodes.count == 1 ? "match" : "matches").")
    }

}
